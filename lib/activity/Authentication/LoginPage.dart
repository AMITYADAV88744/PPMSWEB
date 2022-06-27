
import 'package:flutter/foundation.dart';
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


  late String _email;
  late String _pass;
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
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Project Management',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
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
                  child: const Text('Forgot Password'),
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: const Text('Login '),
                        onPressed: () {
                          _login();
                        }
                    )),
                TextButton(
                  onPressed: (){
                    if (kDebugMode) {
                      print("Login->Register");
                    }

                    // Create Account
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Register()));
                  },
                  style: TextButton.styleFrom(primary: Colors.blue),
                  child: const Text('Do not have !! Create Account'),
                ),
              ],
            )
        )
    );
  }

  void _login() async {
    final user = ParseUser(_email.toUpperCase(), _pass, null);

    var response = await user.login();

    if (response.success) {
      if (kDebugMode) {
        print("Login->Dashconnection");
      }
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashConnection()));
    } else {
      if (kDebugMode) {
        print(response.error!.message);
      }
      final snackbar = SnackBar(
          content: Text(
              response.error!.message));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);

    }

}
}
