import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_application/CRUD.dart';
import 'package:job_application/Welcome.dart';
import 'package:job_application/companyWelcome.dart';
import 'package:job_application/signUp.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool showSpinner = false;
  String email;
  String password;
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    loggedinuser();
    super.initState();
  }

  loggedinuser() async {
    FirebaseAuth.instance.currentUser().then((firebaseUser) {
      if (firebaseUser == null) {
        //signed out
      } else if (firebaseUser != null) {
        //signed in
        if(CRUD.type=="seller"){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Welcome()),
          );
        }
        else{
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CWelcome()),
          );
        }

      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      onChanged: (String value) {
                        email = value.trim();
                      },
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
                      onChanged: (String value) {
                        password = value.trim();
                      },
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
                    SizedBox(height: 30.0),
                    SizedBox(
                      width: double.infinity,
                      child: RaisedButton(
                        color: Colors.white,
                        textColor: Colors.lightBlue,
                        padding: const EdgeInsets.all(20.0),
                        child: Text("Login".toUpperCase()),
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
                                      .signInWithEmailAndPassword(
                                  email: email,
                                  password: password))
                              .user;

                          if (newuser != null &&
                          newuser.isEmailVerified == true) {
                          CRUD.email = email;

                          if(CRUD.type=="seller")
                          {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Welcome()),
                            );
                          }
                          else{
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CWelcome()),
                            );


                          }





                          } else {
                          Fluttertoast.showToast(
                          msg:
                          "Please Verify Your Email.",
                          gravity: ToastGravity.CENTER);
                          }
                          setState(() {
                          showSpinner = false;
                          });
                          } catch (e) {
                          print(e);
                          Fluttertoast.showToast(
                          msg:
                          "Incorrect email or password",
                          gravity: ToastGravity.CENTER);

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
                          child: Text("Create Account".toUpperCase()),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUp()),
                            );
                          },
                        ),
                        Container(
                          color: Colors.white54,
                          width: 2.0,
                          height: 20.0,
                        ),
                        FlatButton(
                          textColor: Colors.white70,
                          child: Text("Forgot Password".toUpperCase()),
                          onPressed: () {

                            _asyncInputDialog(context);
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
  Future<String> _asyncInputDialog(BuildContext context) async {
    String email = '';
    return showDialog<String>(
      context: context,
      barrierDismissible:
      false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            'Enter Your Email Address',
            style: TextStyle(color: Colors.black87),
          ),
          content: new Row(
            children: <Widget>[
              new Expanded(
                  child: new TextField(
                    style: TextStyle(color: Colors.black87, fontSize: 20),
                    cursorColor: Colors.black87,
                    keyboardType: TextInputType.emailAddress,
                    autofocus: true,
                    decoration: new InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelText: 'Email : ',
                      hintText: 'xyz@example.com',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {
                      email = value;
                    },
                  ))
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Cancel',
              ),
              color: Colors.red,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              color: Colors.green,
              child: Text(
                'Send',
              ),
              onPressed: () {
                if (email != null && email.contains("@")) {
                  final _auth = FirebaseAuth.instance;
                  _auth.sendPasswordResetEmail(email: email).then((onValue) {
                    Fluttertoast.showToast(
                      msg: "Email Sent",
                      toastLength: Toast.LENGTH_LONG,
                    );
                  });

                  Navigator.of(context).pop();
                } else {
                  Fluttertoast.showToast(
                    msg: "Email not Valid",
                    toastLength: Toast.LENGTH_LONG,
                  );
                }
                //Navigator.of(context).pop(newcardNo);
              },
            ),
          ],
        );
      },
    );
  }
}
