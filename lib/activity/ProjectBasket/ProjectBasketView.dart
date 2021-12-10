import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:ppmsweb/models/ProjectList.dart';
import '../../constants.dart';
import '../SelectTeam/SelectTeam.dart';
import 'HeaderP.dart';

class ProjectBasketView extends StatefulWidget {
  const ProjectBasketView({Key? key}) : super(key: key);
  @override
  _ProjectBasketView createState() => _ProjectBasketView();
}


class _ProjectBasketView extends State<ProjectBasketView>  {
  final ScrollController _firstController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            HeaderP(),
            SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    child: SizedBox(
                    height:double.maxFinite,
                        child: FutureBuilder<List<ParseObject>>(
                            future: getTodo(),
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.none:
                                case ConnectionState.waiting:
                                  return Center(
                                    child: Container(
                                        width: 100,
                                        height: 100,
                                        child: CircularProgressIndicator()),
                                  );
                                default:
                                  if (snapshot.hasError) {
                                    return Center(
                                      child: Text("Error..."),
                                    );
                                  }
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: Text("No Data..."),
                                    );
                                  } else {

                                    return ListView.builder(
                                        padding: EdgeInsets.only(top: 10.0),
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, index) {
                                          //*************************************
                                          //Get Parse Object Values
                                          final varTodo = snapshot.data![index];
                                          final varTitle = varTodo.get<String>('p_title')!;
                                          final varPid = varTodo.get<int>('p_id')!;                                          //*************************************

                                          //************************************
                                          return Container(
                                              margin: EdgeInsets.only(top: defaultPadding),
                                              decoration: BoxDecoration(
                                                border: Border.all(width: 2, color: primaryColor.withOpacity(0.15)),
                                                borderRadius: const BorderRadius.all(
                                                  Radius.circular(defaultPadding),
                                                ),
                                              ),
                                              child:ListTile(
                                                leading:CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      "https://images.unsplash.com/photo-1547721064-da6cfb341d50"),
                                                ),
                                                title: Text(varTitle),
                                                onTap: (){
                                                  final ProjectList projectdata = ProjectList(
                                                       p_title: varTitle, p_id: varPid,

                                                  );
                                                  Navigator.push(context,
                                                      MaterialPageRoute(builder: (
                                                          context) => SelectTeam(projectList:projectdata),
                                                      )
                                                  );
                                                  },
                                              ),
                                          );
                                        }
                                        );
                                  }
                              }
                            }
                            ),
                    ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Future<List<ParseObject>> getTodo() async {
    QueryBuilder<ParseObject> queryTodo =
    QueryBuilder<ParseObject>(ParseObject('ProjectList'));
    final ParseResponse apiResponse = await queryTodo.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }
}


/*
StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance.collection("ProjectBasket").snapshots(includeMetadataChanges: true),
                          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>querySnapshot){
                            if(querySnapshot.hasError)
                              return Text("Some Error");
                            if(querySnapshot.connectionState==ConnectionState.waiting){
                              return CircularProgressIndicator();
                            }else {
                              final projectlist=querySnapshot.data!.docs;
                              return ListView.builder(itemBuilder: (context,index){
                                return Container(
                                margin: EdgeInsets.only(top: defaultPadding),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 2, color: primaryColor.withOpacity(0.15)),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(defaultPadding),
                                  ),
                                ),
                                child: ListTile(
                                  leading:CircleAvatar(
                                    backgroundImage:
                                    NetworkImage("https://images.unsplash.com/photo-1547721064-da6cfb341d50"),
                                  ),
                                  title: Text(projectlist[index]["p_title"]),
                                  onTap: (){
                                    String ptitle=projectlist[index]["p_title"];
                                    int pid=projectlist[index]["p_id"];
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SelectTeam(ptitle:ptitle,pid:pid),
                                        ));

                                  },
                                ),
                              );
                            },
                                itemCount:projectlist.length,
                            );
                            }
                          },
                        ),
 */
