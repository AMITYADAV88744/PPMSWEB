import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';


class ProfilePicCard extends StatelessWidget{
   ProfilePicCard({Key? key}) : super(key: key);
  ParseUser? currentUser;

  Future<ParseUser?> getUserQuery() async {
    currentUser = await ParseUser.currentUser() as ParseUser?;
    return currentUser;
  }
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
          height: 200,
          child:FutureBuilder<ParseUser?>(
              future: getUserQuery(),
              builder: (context,snapshot){
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                  default:
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("Error..."),
                      );
                    }
                    if (!snapshot.hasData) {
                      return const Center(
                        child: Text("No Data..."),
                      );
                    } else {
                      ParseFileBase? varFile =
                      snapshot.data!.get<ParseFileBase>('profilepic');
                      return InkWell(
                        onTap: () {
                          _pickFile();
                        },
                        child: CircleAvatar(
                          radius: 70,
                          child: ClipOval(
                            child: Image.network(varFile!.url!,
                              height: 150,
                              width: 150,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      );
                    }
                }
              }
              ),
    );
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    // if no file is picked
    if (result != null) {
      result.files.first.name;
      ParseFileBase parseFile;
      ParseUser? currentUser;

      currentUser = await ParseUser.currentUser() as ParseUser?;

      if (kIsWeb) {
        //Flutter Web
        parseFile = ParseWebFile(
            result.files.first.bytes,
            name: '${result.files.first.name}.img'); //Name for file is required

        await parseFile.save();
        currentUser!.set('profilepic',parseFile);
        await currentUser.save();


        if (kDebugMode) {
          print(result.files.first.name);
        }
        return;
      }
    }
  }

}
