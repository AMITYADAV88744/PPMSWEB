import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'activity/Authentication/LoginPage.dart';
import 'constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppmsweb/activity/dashboard/DashConnection.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const keyApplicationId = 'EEyRHEeh6nalrywa4014SQjttyGCbqbmeuNieDnc';
  const keyClientKey = 'mBJpELW2OGkLbo912zU31T4C1AAFy39txKOIVEXl';
  const keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);

  if (kDebugMode) {
    print('done');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);


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
                    if (kDebugMode) {
                      print("main->Dashconnection");
                    }
                    return const DashConnection();
                  } else {
                    if (kDebugMode) {
                      print("main->LoginPage");
                    }
                    return const LoginPage();
                  }
              }
            }),
    );
  }
}
