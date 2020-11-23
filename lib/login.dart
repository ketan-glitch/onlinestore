import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<UserCredential> _signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: gSA.accessToken,
      idToken: gSA.idToken,
    );
    return await _auth.signInWithCredential(credential);
  }

  void _signOut() {
    googleSignIn.signOut();
    print('User Signed Out');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignIn Page'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton.icon(
                onPressed: () => _signIn().then((user) {
                  print('User Details:');
                  print(user.user.displayName);
                  print(user.user.email);
                  print(user.user.uid);
                  print(user.user.photoURL);
                }).catchError((e) => print(e)),
                icon: Icon(Icons.login),
                label: Text('Login'),
                color: Colors.green,
              ),
              RaisedButton.icon(
                  onPressed: _signOut,
                  icon: Icon(Icons.logout),
                  label: Text('Sign out'),
                  color: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}
