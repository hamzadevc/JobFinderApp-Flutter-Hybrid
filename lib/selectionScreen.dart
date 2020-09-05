import 'package:flutter/material.dart';
import 'companyWelcome.dart';
import 'package:job_application/signIn.dart';

class SelectCategory extends StatefulWidget {
  @override
  _SelectCategoryState createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        width: MediaQuery.of(context).size.width,
        decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.indigoAccent, Colors.deepPurple],
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          RaisedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignIn()),
              );
            },
            textColor: Colors.white,
            color: Colors.red,
            padding: const EdgeInsets.all(8.0),
            child: new Text(
              "Register As Employee"
              ,
            ),
          ),
          RaisedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Welcome()),
              );
            },
            textColor: Colors.white,
            color: Colors.black,
            padding: const EdgeInsets.all(8.0),
            child: new Text(
              "Register As Company",
            ),
          )


        ],)
      ),
    );
  }
}
