
import 'dart:html';

import 'package:data_table_2/data_table_2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:ppmsweb/models/PendingTask.dart';
import '../../constants.dart';

class PendingDocument extends StatefulWidget{
  const PendingDocument({Key? key}) : super(key: key);

  @override
  _PendingDocumentState createState() => _PendingDocumentState();
}

class _PendingDocumentState extends State<PendingDocument> {

  late final String titles;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FutureBuilder<List<ParseObject>>(
          future: getList(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return const Center(
                  child: SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator()),
                );
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
                  var index = snapshot.data!.length;
                  var pendingTask = snapshot.data!;
                  int i = pendingTask.length;
                  for (int j = 0; j < i; j++) {
                    if (kDebugMode) {
                      print(pendingTask[j].get('title'));

                    }
                  }


                  return DataTable2(
                      columnSpacing: defaultPadding,
                      minWidth: 600,
                      columns: const [
                        DataColumn(
                          label: Text("File Name"),
                        ),
                        DataColumn(
                          label: Text("Due Date"),
                        ),
                        DataColumn(
                          label: Text("Upload File"),
                        ),
                      ],
                      rows: List.generate(i, (index) {
                        return DataRow(
                            cells: [
                              DataCell(
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/doc_file.svg",
                                      height: 30,
                                      width: 30,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: defaultPadding),
                                      child: Text(
                                          pendingTask[index].get('title'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              DataCell(
                                  Text(pendingTask[index].get('duedate'),)
                              ),
                              DataCell(
                                  RaisedButton(
                                    textColor: Colors.white,
                                    color: Colors.blueAccent,
                                    onPressed: () {
                                      _pickFile(titles);
                                    },
                                    child: const Text('Choose File'),), 
                                onTap: (){_getSelectedRowInfo(pendingTask[index].get('title'),pendingTask[index].get('duedate'));},
                              ),
                            ]
                        );
                      }
                      ).toList()
                  );
                }
            }
          }
      ),
    );
  }

  Future<List<ParseObject>> getList() async {
    QueryBuilder<ParseObject> queryTodo =
    QueryBuilder<ParseObject>(ParseObject('PendingTask'));
    final ParseResponse apiResponse = await queryTodo.query();
    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }

  void _getSelectedRowInfo(title, duedate) {

    titles=title;
    return _pickFile(titles);
  }
  void _pickFile(String titles) async {
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
            await result.files.first.bytes,
            name: '${result.files.first.name}.txt'); //Name for file is required

        await parseFile.save();

        final gallery = ParseObject('StudentUpload')..set('student_id', currentUser!.username)..set('title', titles)
          ..set('file', parseFile);
        await gallery.save();


        if (kDebugMode) {
          print(result.files.first.name);
        }
        return;
      }
    }
  }




}


