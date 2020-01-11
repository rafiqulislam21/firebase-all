import 'package:firebase_all/services/user_management.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.00),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Sign up Page',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(width: 20),
              TextField(
                decoration: InputDecoration(hintText: 'Email'),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Password'),
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              RaisedButton(
                child: Text('Submit'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 5,
                onPressed: () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _email,
                          password: _password,
                        )
                      .then((signedInUser) {
                        print('user created!');
                    UserManagement().storeNewUser(context, signedInUser);
                  }).catchError((e) {
                    print(e);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
