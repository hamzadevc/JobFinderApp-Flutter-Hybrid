import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job_application/signIn.dart';

class CRUD{
////profile details
  static String name="Enter Your Name";
  static String email="Enter Email ID";
  static String phoneNumber="Enter Mobile Number";
  static String imgUrl= "https://image.flaticon.com/icons/png/512/0/93.png";
  static String country="Enter Country";
  static String city="Enter City";
  static String address="Enter Address";
  static String dob="Enter Date of Birth";
  static String type="";


////////




static Logout(context)async{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  await _firebaseAuth.signOut().then((_) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => SignIn()),
          (Route<dynamic> route) => false,
    );
//    refresh();
  });




}





}