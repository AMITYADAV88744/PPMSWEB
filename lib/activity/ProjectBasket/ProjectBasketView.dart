
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import '../../constants.dart';
import '../SelectTeam/SelectTeam.dart';
import 'HeaderP.dart';

class ProjectBasketView extends StatefulWidget {
  const ProjectBasketView({Key? key}) : super(key: key);
  @override
  _ProjectBasketView createState() => _ProjectBasketView();
}


class _ProjectBasketView extends State<ProjectBasketView>  {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const HeaderP(),
            const SizedBox(height: defaultPadding),
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

                                    return ListView.builder(
                                        padding: const EdgeInsets.only(top: 10.0),
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, index) {
                                          //*************************************
                                          //Get Parse Object Values
                                          final varTodo = snapshot.data![index];
                                          final varTitle = varTodo.get<String>('p_title')!;
                                          final varPid = varTodo.get<int>('p_id')!;                                          //*************************************

                                          //************************************
                                          return Container(
                                              margin: const EdgeInsets.only(top: defaultPadding),
                                              decoration: BoxDecoration(
                                                border: Border.all(width: 2, color: primaryColor.withOpacity(0.15)),
                                                borderRadius: const BorderRadius.all(
                                                  Radius.circular(defaultPadding),
                                                ),
                                              ),
                                              child:ListTile(
                                                leading:const CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      "https://images.unsplash.com/photo-1547721064-da6cfb341d50"),
                                                ),
                                                title: Text(varTitle),
                                                onTap: (){
                                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SelectTeam(pid: varPid,title:varTitle)));

                                                //  Navigator.push(context, MaterialPageRoute(builder: (context) =>  const SelectTeam(),));
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

