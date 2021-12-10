import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'activity/Authentication/LoginPage.dart';
import 'constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppmsweb/activity/dashboard/DashConnection.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final keyApplicationId = 'EEyRHEeh6nalrywa4014SQjttyGCbqbmeuNieDnc';
  final keyClientKey = 'mBJpELW2OGkLbo912zU31T4C1AAFy39txKOIVEXl';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);

  print('done');

  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  Future<bool> hasUserLogged() async {
    ParseUser? currentUser = await ParseUser.currentUser() as ParseUser?;
    if (currentUser == null) {
      return false;
    }
    //Checks whether the user's session token is valid
    final ParseResponse? parseResponse =
    await ParseUser.getCurrentUserFromServer(currentUser.sessionToken!);

    if (parseResponse?.success == null || !parseResponse!.success) {
      //Invalid session. Logout
      await currentUser.logout();
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project Management System',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
        home:  FutureBuilder<bool>(
            future: hasUserLogged(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Scaffold(
                    body: Center(
                      child: Container(
                          width: 100,
                          height: 100,
                          child: CircularProgressIndicator()),
                    ),
                  );
                default:
                  if (snapshot.hasData && snapshot.data!) {
                    print("main->Dashconnection");
                    return const DashConnection();
                  } else {
                    print("main->LoginPage");
                    return const LoginPage();

                  }
              }
            }),
    );

  }
}
