import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:ppmsweb/activity/dashboard/DashConnection.dart';
import 'Register.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late String _email;
  late String _pass;
  @override
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
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Project Management',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
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
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    onChanged: (value){
                      _pass=value;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  style: TextButton.styleFrom(primary: Colors.blue),
                  child: Text('Forgot Password'),
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: Text('Login '),
                        onPressed: () {
                          _login();
                        }
                    )),
                TextButton(
                  onPressed: (){
                    print("Login->Register");

                    // Create Account
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Register()));
                  },
                  style: TextButton.styleFrom(primary: Colors.blue),
                  child: Text('Do not have !! Create Account'),
                ),
              ],
            )
        )
    );
  }

  void _login() async {
    final user = ParseUser(_email, _pass, null);

    var response = await user.login();

    if (response.success) {
      print("Login->Dashconnection");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashConnection()));
    } else {
      print(response.error!.message);
      final snackbar = SnackBar(
          content: Text(
              response.error!.message));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);

    }

}
}
