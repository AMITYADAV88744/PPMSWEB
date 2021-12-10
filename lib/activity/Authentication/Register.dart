import 'package:flutter/cupertino.dart';
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

  bool _isLoading = false;

  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
        padding: EdgeInsets.all(20),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Image(
                      image: AssetImage('assets/login_logo.png'),
                    ),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Project Management',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                    ),
                ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 20),
                    ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    onChanged: (value){
                      _fullName=value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Full Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    onChanged: (value){
                      _userID=value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'UserID',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    onChanged: (value){
                      _email=value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextField(
                    onChanged: (value){
                      _pass=value;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Register '),
                      onPressed: () {
                        
                        _createaccount();

                      }
                    )),
                FlatButton(
                  onPressed: (){
                    // Create Account
                    print("Register>Login");

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  textColor: Colors.blue,
                  child: Text('Already have account!! Login '),
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
            new FlatButton(
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
      print("Register->Dashconnection");

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashConnection()));
    } else {
      showError(response.error!.message);
    }
  }

}



