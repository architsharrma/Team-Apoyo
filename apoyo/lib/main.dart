import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:Apoyo/pages/home.dart';
import 'package:Apoyo/pages/utils.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
    googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        currentUser = account;
      });
    });
    signInSilent();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      print("error");
    }
    return MaterialApp(
        theme:
            ThemeData(primaryColor: Colors.red[700], accentColor: Colors.red),
        home: (!_initialized || currentUser == null)
            ? Scaffold(
                body: Container(
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: new AssetImage("assets/login.png"),
                          fit: BoxFit.cover)),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 300),
                      child: (!_initialized)
                          ? CircularProgressIndicator()
                          : FlatButton(
                              padding: EdgeInsets.all(16),
                              splashColor: Colors.red,
                              focusColor: Colors.red,
                              textColor: Colors.white,
                              child: Text(
                                "Sign in with Google",
                                style: TextStyle(
                                    fontSize: 21, fontWeight: FontWeight.w500),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              color: Colors.red,
                              onPressed: handleSignIn,
                            ),
                    ),
                  ),
                ),
              )
            : HomePage());
  }
}
