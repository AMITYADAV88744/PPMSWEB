import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import '../../../constants.dart';

class TeamMember extends StatefulWidget{
  const TeamMember({Key? key}) : super(key: key);

  @override
  _TeamMember createState() => _TeamMember();
}
class _TeamMember extends State<TeamMember> {
  late String member_1;
  late String member_2;
  late String member_3;
  late String member_4;
  late String role_1;
  late String role_2;
  late String role_3;
  late String role_4;



  Future<List<ParseObject>> getTodo() async {
    ParseUser? currentUser;
    String projectID;
    currentUser = await ParseUser.currentUser() as ParseUser?;
    projectID=currentUser!.get('objectId');
    final QueryBuilder<ParseObject> parseQuery = QueryBuilder<ParseObject>(ParseObject('StudentTeam'));
    parseQuery.whereContains('projectID', projectID);
    final apiResponse = await parseQuery.query();
    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    }else{
      return [];
    }
  }

  @override
  Widget build(BuildContext context){

    return Container(
        padding: const EdgeInsets.all(defaultPadding),
        decoration: const BoxDecoration(color: secondaryColor,
        borderRadius:  BorderRadius.all(Radius.circular(10)
        )
        ),
        child: FutureBuilder<List<ParseObject>>(
            future: getTodo(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                return  const Center(
                    child: SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator()),
                );
                default:
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Error..."),);
                  }
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text("No Data..."),);
                  } else {
                    for (int i = 0; i < snapshot.data!.length; i++) {
                      final snap = snapshot.data![i];
                       member_1 = snap.get<String>('member_1')!;
                       role_1 = snap.get<String>('role_1')!;
                       member_2 = snap.get<String>('member_2')!;
                       role_2 = snap.get<String>('role_2')!;
                       member_3 = snap.get<String>('member_3')!;
                      role_3 = snap.get<String>('role_3')!;
                      member_4 = snap.get<String>('member_4')!;
                      role_4 = snap.get<String>('role_4')!;
                      if (kDebugMode) {
                        print(snap);
                      }
                    }
                    return ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          ListTile(
                            leading: const CircleAvatar(
                              backgroundImage: AssetImage(
                                  "assets/images/avtar_team.png"),
                            ),
                            title: Text(member_1),
                            trailing: Text(role_1),
                          ),
                          ListTile(
                            leading: const CircleAvatar(
                              backgroundImage: AssetImage(
                                  "assets/images/avtar_team.png"),
                            ),
                            title: Text(member_2),
                            trailing:role_2.isEmpty
                                ? IconButton(
                                onPressed: addrole(),
                                icon: const Icon(Icons.add)
                            )
                                :Text(role_2),),
                          ListTile(
                            leading: const CircleAvatar(
                              backgroundImage: AssetImage(
                                  "assets/images/avtar_team.png"),
                            ),
                            title: Text(member_3),
                            trailing:role_3.isEmpty
                                ? IconButton(
                                onPressed: addrole(),
                                icon: const Icon(Icons.add)
                            )
                            :Text(role_3),
                          ),
                          ListTile(
                            leading: const CircleAvatar(
                              backgroundImage: AssetImage(
                                  "assets/images/avtar_team.png"),
                            ),
                            title: Text(member_4),
                            trailing:role_4.isEmpty
                              ? IconButton(
                                onPressed: addrole(),
                                icon: const Icon(Icons.add)
                            )
                                :Text(role_4),



                          ),
                        ]
                    );
                  }
              }
            }
    ),

    );
  }

  addrole() {}


}

