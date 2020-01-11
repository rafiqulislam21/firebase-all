import 'package:firebase_all/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25.00),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You are Logged in.',
                style: TextStyle(fontSize: 30, color: Colors.green),
              ),
              SizedBox(width: 20),
              SizedBox(
                height: 15.0,
              ),
              OutlineButton(
                borderSide: BorderSide(
                    color: Colors.red, style: BorderStyle.solid, width: 3.0),
                child: Text('Logout'),
                onPressed: () {
                  FirebaseAuth.instance
                      .signOut()
                      .then((value) {
                        Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  })
                      .catchError((e) {
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
