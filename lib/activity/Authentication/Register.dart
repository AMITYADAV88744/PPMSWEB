import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ppmsweb/activity/dashboard/DashConnection.dart';
import 'LoginPage.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late String _email;
  late String _pass;
  late String _fullName;
  late String _userID;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
        padding: const EdgeInsets.all(20),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Image(
                      image: AssetImage('assets/login_logo.png'),
                    ),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Project Management',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                    ),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 20),
                    ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    onChanged: (value){
                      _fullName=value;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Full Name',
                    ),
                  ),
                ),
                Container(
                  padding:const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    onChanged: (value){
                      _userID=value;
                    },
                    decoration:const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'UserID',
                    ),
                  ),
                ),
                Container(
                  padding:const EdgeInsets.all(10),
                  child: TextField(
                    onChanged: (value){
                      _email=value;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding:const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextField(
                    onChanged: (value){
                      _pass=value;
                    },
                    obscureText: true,
                    decoration:const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    padding:const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child:const Text('Register '),
                      onPressed: () {
                        
                        _createaccount();

                      }
                    )),
                FlatButton(
                  onPressed: (){
                    // Create Account
                    if (kDebugMode) {
                      print("Register>Login");
                    }

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const LoginPage()));
                  },
                  textColor: Colors.blue,
                  child:const Text('Already have account!! Login '),
                ),
              ],
            ),
        ),
    );
  }
  void showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error!"),
          content: Text(errorMessage),
          actions: <Widget>[
            FlatButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void _createaccount() async {

    final user = ParseUser.createUser(_userID, _pass, _email);
    user.set("displayName", _fullName);
    var response = await user.signUp();

    if (response.success) {
      if (kDebugMode) {
        print("Register->Dashconnection");
      }

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashConnection()));
    } else {
      showError(response.error!.message);
    }
  }

}



