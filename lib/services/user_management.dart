import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_all/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserManagement {
  storeNewUser(context, result) {
    print(result);
    print(result.user.email);
    Firestore.instance
        .collection('/users')
        .add({'email': result.user.email, 'uid': result.user.uid}).then((value) {
      //prevent login page back Button
      Navigator.of(context).pop();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }).catchError((e) {
      print(e);
    });
  }
}
