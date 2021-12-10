import 'package:ppmsweb/models/ProjectList.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:ppmsweb/Navigation_UI/components/header.dart';
import 'package:ppmsweb/Navigation_UI/components/side_menu.dart';
import 'package:ppmsweb/activity/dashboard/DashConnection.dart';
import '../../../Navigation_UI/controllers/MenuController.dart';
import '../../constants.dart';
import '../../responsive.dart';

class SelectTeam extends StatelessWidget {

  final ProjectList projectList;

  SelectTeam({Key? key,   required this.projectList,}) : super(key: key);
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MenuController(),
        ),
      ],
      child:SelectTeamScreen(projectList:projectList),
    );
  }
}
class SelectTeamScreen extends StatefulWidget{
  final ProjectList projectList;

  SelectTeamScreen({Key? key, required this.projectList, }) : super(key: key);

  @override
  State<SelectTeamScreen> createState() => _MyStatefulWidgetState(projectList.p_id.toString());

}
class _MyStatefulWidgetState extends State<SelectTeamScreen> {
  var selectedmember1;
  var selectedmember2;
  var selectedmember3;
  var selectedmember4;

  _MyStatefulWidgetState(String p_id);

    Widget build(BuildContext context) {

      return Scaffold(
        key: context.read<MenuController>().scaffoldKey,
        drawer: SideMenu(),
        body: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // We want this side menu only for large screen
              if (Responsive.isDesktop(context))
                Expanded(
                  // default flex = 1
                  // and it takes 1/6 part of the screen
                  child:const SideMenu(),
                ),
              Expanded(
                // It takes 5/6 part of the screen
                flex: 5,
                child: SafeArea(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Column(
                      children: [
                        HeaderT(),
                        SizedBox(height: defaultPadding),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(defaultPadding),
                                margin: EdgeInsets.only(top: defaultPadding),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: primaryColor.withOpacity(0.15)),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(defaultPadding),
                                  ),
                                ),
                                child: SizedBox(width: defaultPadding,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: defaultPadding,),
                                      Column(
                                        children: [
                                          SizedBox(height: 10),
                                          Text("Project ID",
                                            style: Theme
                                                .of(context)
                                                .textTheme
                                                .headline6,),
                                          SizedBox(height: 30),
                                          Column(
                                              crossAxisAlignment: CrossAxisAlignment
                                                  .start,
                                              children: <Widget>[

                                                FutureBuilder<List<ParseObject>>(
                                                    future: doUserQuery(),
                                                    builder: (context, snapshot){
                                                      switch (snapshot.connectionState) {
                                                        case ConnectionState.none:
                                                        case ConnectionState.waiting:
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
                                                            //List _userID = [];
                                                            List<DropdownMenuItem>_userID = [];
                                                            for (int i = 0; i <
                                                                snapshot.data!.length; i++) {
                                                              final snap=snapshot.data![i];
                                                              var snaps=snap.get<String>('username');
                                                              print(snap);
                                                              _userID.add(

                                                                  DropdownMenuItem(
                                                                    child: Text(snaps!),
                                                                    value: "${snaps}",
                                                                  ));
                                                              //_userID.add(snaps);
                                                              print(snaps);
                                                              print("*********");
                                                            }
                                                            print(_userID);
                                                            return Column(
                                                              crossAxisAlignment: CrossAxisAlignment
                                                                  .start,
                                                              children: <Widget>[
                                                                DropdownButtonFormField(
                                                                  decoration: InputDecoration(
                                                                    border: OutlineInputBorder(),
                                                                    labelText: 'Leader ',),
                                                                  icon: const Icon(
                                                                      Icons.arrow_drop_down),
                                                                  iconSize: 24,
                                                                  elevation: 16,
                                                                  style: Theme
                                                                      .of(context)
                                                                      .textTheme
                                                                      .headline6,
                                                                  items: _userID,
                                                                  onChanged: (uservalue) {
                                                                  final snackbar = SnackBar(
                                                                      content: Text(
                                                                          " $uservalue Selected "
                                                                      ));
                                                                  Scaffold.of(context)
                                                                      .showSnackBar(
                                                                      snackbar);
                                                                  setState(() {
                                                                    selectedmember1 = uservalue;
                                                                  });
                                                                },
                                                                  value: selectedmember1,
                                                                ),
                                                                SizedBox(height: 20,),
                                                                DropdownButtonFormField(
                                                                  decoration: InputDecoration(
                                                                    border: OutlineInputBorder(),
                                                                    labelText: 'Member 1',),
                                                                  icon: const Icon(
                                                                      Icons.arrow_drop_down),
                                                                  iconSize: 24,
                                                                  elevation: 16,
                                                                  style: Theme
                                                                      .of(context)
                                                                      .textTheme
                                                                      .headline6,
                                                                  items: _userID,                                                          onChanged: (uservalue) {
                                                                  final snackbar = SnackBar(
                                                                      content: Text(
                                                                          " $uservalue Selected "
                                                                      ));
                                                                  Scaffold.of(context)
                                                                      .showSnackBar(
                                                                      snackbar);
                                                                  setState(() {
                                                                    selectedmember2 = uservalue;
                                                                  });
                                                                },
                                                                  value: selectedmember2,

                                                                ),
                                                                SizedBox(height: 20,),
                                                                DropdownButtonFormField(
                                                                  decoration: InputDecoration(
                                                                    border: OutlineInputBorder(),
                                                                    labelText: 'Member 2',),
                                                                  icon: const Icon(
                                                                      Icons.arrow_drop_down),
                                                                  iconSize: 24,
                                                                  elevation: 16,
                                                                  style: Theme
                                                                      .of(context)
                                                                      .textTheme
                                                                      .headline6,
                                                                  items: _userID,
                                                                  onChanged: (uservalue) {
                                                                    final snackbar = SnackBar(
                                                                        content: Text(
                                                                            " $uservalue Selected "
                                                                        ));
                                                                    Scaffold.of(context)
                                                                        .showSnackBar(
                                                                        snackbar);
                                                                    setState(() {
                                                                      selectedmember3 = uservalue;
                                                                    });
                                                                  },
                                                                  value: selectedmember3,
                                                                ),
                                                                SizedBox(height: 20,),
                                                                DropdownButtonFormField(
                                                                  decoration: InputDecoration(
                                                                    border: OutlineInputBorder(),
                                                                    labelText: 'Member 3',),
                                                                  icon: const Icon(
                                                                      Icons.arrow_drop_down),
                                                                  iconSize: 24,
                                                                  elevation: 16,
                                                                  style: Theme
                                                                      .of(context)
                                                                      .textTheme
                                                                      .headline6,
                                                                  items: _userID,
                                                                  onChanged: (uservalue) {
                                                                    final snackbar = SnackBar(
                                                                        content: Text(
                                                                            " $uservalue Selected "
                                                                        ));
                                                                    Scaffold.of(context)
                                                                        .showSnackBar(
                                                                        snackbar);
                                                                    setState(() {
                                                                      selectedmember4 = uservalue;
                                                                    });
                                                                  },
                                                                  value: selectedmember4,

                                                                ),
                                                              ],

                                                            );

                                                          }
                                                      }
                                                    }
                                                ),
                                              ]
                                          ),
                                          SizedBox(height: 20),
                                          Container(
                                              height: 50,
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 0, 10, 0),
                                              margin: EdgeInsets.only(
                                                  top: defaultPadding),
                                              decoration: BoxDecoration(
                                                border: Border.all(width: 2,
                                                    color: primaryColor.withOpacity(
                                                        0.15)),
                                                borderRadius: const BorderRadius.all(
                                                  Radius.circular(defaultPadding),
                                                ),
                                              ),
                                              child: RaisedButton(
                                                  textColor: Colors.white,
                                                  color: bgColor,
                                                  child: Text('Save'),
                                                  onPressed: () {
                                                    String pid;
                                                    _saveTeam();
                                                  }
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                )
              ),
            ],
          ),
        ),
      );
    }
  Future<void> _saveTeam() async {
    ParseUser? currentUser;
    String projectID;

    currentUser = await ParseUser.currentUser() as ParseUser?;
    projectID=currentUser!.get('objectId');
    final _createTeam = ParseObject('StudentTeam')..set('projectID',projectID)
      ..set('member_1', selectedmember1)..set('role_1', 'Leader')
      ..set('member_2', selectedmember2)..set('role_2', '')..
      set('member_3', selectedmember3)..set('role_3', '')
      ..set('member_4', selectedmember4)..set('role_4', '');
    await _createTeam.save();
    final setstaus = ParseObject('ProjectStatus')
      ..set('username', selectedmember1)..set('project',true);
    await setstaus.save();
    final setstaus2 = ParseObject('ProjectStatus')
      ..set('username', selectedmember2)..set('project',true);
    await setstaus2.save();
    final setstaus3 = ParseObject('ProjectStatus')
      ..set('username', selectedmember3)..set('project',true);
    await setstaus3.save();
    final setstaus4 = ParseObject('ProjectStatus')
      ..set('username', selectedmember4)..set('project',true);
    await setstaus4.save();
    //await _update();
    currentUser.set('project_status', true);
    await currentUser.save();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashConnection()));




  }

  Future<List<ParseObject>> doUserQuery() async {
    QueryBuilder<ParseUser> queryUsers =
    QueryBuilder<ParseUser>(ParseUser.forQuery());
    final ParseResponse apiResponse = await queryUsers.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }


}