import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_application/admin.dart';
import 'package:job_application/signIn.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'CRUD.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool showSpinner = false;
  String email;
  String password;
  String Cpassword;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.indigoAccent, Colors.deepPurple],
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 40.0, bottom: 20.0),
                      height: 80,
                    ),
                    Text(
                      "JOB PORTAL",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 40.0),
                    TextField(

                      onChanged:( (value){
                        email=value;
                      }),

                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16.0),
                        prefixIcon: Container(
                            padding:
                            const EdgeInsets.only(top: 16.0, bottom: 16.0),
                            margin: const EdgeInsets.only(right: 8.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    bottomLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0),
                                    bottomRight: Radius.circular(10.0))),
                            child: Icon(
                              Icons.person,
                              color: Colors.lightBlue,
                            )),
                        hintText: "enter your email",
                        hintStyle: TextStyle(color: Colors.white54),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      onChanged:( (value){
                        password=value;
                      }),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16.0),
                        prefixIcon: Container(
                            padding:
                            const EdgeInsets.only(top: 16.0, bottom: 16.0),
                            margin: const EdgeInsets.only(right: 8.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    bottomLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0),
                                    bottomRight: Radius.circular(10.0))),
                            child: Icon(
                              Icons.lock,
                              color: Colors.lightBlue,
                            )),
                        hintText: "enter your password",
                        hintStyle: TextStyle(color: Colors.white54),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      onChanged:((value){
                        Cpassword=value;
                      }),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16.0),
                        prefixIcon: Container(
                            padding:
                            const EdgeInsets.only(top: 16.0, bottom: 16.0),
                            margin: const EdgeInsets.only(right: 8.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    bottomLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0),
                                    bottomRight: Radius.circular(10.0))),
                            child: Icon(
                              Icons.lock,
                              color: Colors.lightBlue,
                            )),
                        hintText: "Conifirm your password",
                        hintStyle: TextStyle(color: Colors.white54),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 30.0),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        color: Colors.white,
                        textColor: Colors.lightBlue,
                        padding: const EdgeInsets.all(20.0),
                        child: Text("Sign Up".toUpperCase()),
                        onPressed: () async{

    if (email == null || password == null) {
    Fluttertoast.showToast(
    msg: "Fields cannot be empty",
    toastLength: Toast.LENGTH_LONG,
    );
    return;
    }
    if (email.contains("@") == false) {
    print(email.contains("@"));
    Fluttertoast.showToast(
    msg: "Email not valid",
    toastLength: Toast.LENGTH_LONG,
    );
    return;
    }

    if (email != null && password != null) {
      setState(() {
        showSpinner = true;
      });

      try {
        FirebaseUser newuser = (await _auth
            .createUserWithEmailAndPassword(
            email: email,
            password: password))
            .user;

        if (newuser != null) {
          try {
            await newuser
                .sendEmailVerification();
            Fluttertoast.showToast(
              msg: "Verification Email Sent.",
              toastLength: Toast.LENGTH_LONG,
            );
          } catch (e) {
            print(
                "An error occured while trying to send email  verification");
            print(e.message);
          }
          CRUD.email = email;

          // sendVerificationMail(newuser);
          Fluttertoast.showToast(
            msg: "Successfully Signed Up",
            toastLength: Toast.LENGTH_LONG,
          );
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    SignIn()),
          );
        }
        setState(() {
          showSpinner = false;
        });
      } catch (e) {
        print(e);

        Fluttertoast.showToast(
          msg:
         'Data not correct or email address already in use',
          toastLength: Toast.LENGTH_LONG,
        );

        setState(() {
          showSpinner = false;
        });
      }
    }






                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          textColor: Colors.white70,
                          child: Text("Already Have an Account? Sign IN".toUpperCase()),
                          onPressed: () {

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignIn()),
                            );
                          },
                        ),

                      ],
                    ),
                    //SizedBox(height: 10.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
