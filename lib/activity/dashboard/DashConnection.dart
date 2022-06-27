
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:ppmsweb/activity/ProjectBasket/ProjectBasket.dart';

import '../Main_Screen.dart';

class DashConnection extends StatefulWidget {
  const DashConnection({Key? key}) : super(key: key);

  @override
  _DashConnectionState createState() => _DashConnectionState();
}

class _DashConnectionState extends State<DashConnection> {
  ParseUser? currentUser;
  bool status=false;


  Future<bool> check() async {
    currentUser = await ParseUser.currentUser() as ParseUser?;
   // status=currentUser!.get('project_status');
    /*if(status==true){
      return true;
    }else{
      return false;
    }

     */
    final QueryBuilder<ParseObject> parseQuery = QueryBuilder<ParseObject>(ParseObject('ProjectStatus'));
//true - retrieve documents with field set
//false - retrieve documents without field set
    parseQuery.whereContains('username', currentUser!.get('username'));
    final apiResponse = await parseQuery.query();

    if (apiResponse.success && apiResponse.results != null) {

      if (kDebugMode) {
        print("Dashconnection->DashBoard");
      }
      return true;
    }else{
      if (kDebugMode) {
        print("Dashconnection->Project");
      }
      return false;
    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: FutureBuilder<bool>(
        future: check(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Scaffold(
                body: Center(
                  child: SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator()),
                ),
              );
            default:
              if (snapshot.hasData && snapshot.data!) {
                return const Main_Screen();
              } else {
                return const ProjectBasket();
              }
          }
        })
    );
  }
}
