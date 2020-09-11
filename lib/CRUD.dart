
import 'package:cloud_firestore/cloud_firestore.dart';
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
  static GlobalKey<ScaffoldState> key1 = GlobalKey<ScaffoldState>();
////


  //////loged in userid

  static String myuserid;

  /////



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
  static final _auth = FirebaseAuth.instance;


static Future<bool>fetchProfileData()async{

  var document =Firestore.instance.collection(CRUD.type).document(CRUD.myuserid);
  await document.get().then<dynamic>(( DocumentSnapshot snapshot) async{

     var  userDocument =snapshot.data;
     name= userDocument["name"];
     email=userDocument['email'];
     phoneNumber=userDocument['phone_number'];
     imgUrl=userDocument['img'];
     country=userDocument['country'];
     city=userDocument['city'];
     address=userDocument['address'];
     dob=userDocument['dob'];

     print(name);
  });
return true;
}

static updateProfileData()
async{
  await Firestore.instance.collection(type).document(myuserid).updateData({

    'name':name,
    'email':email,
    'phone_number':phoneNumber,
    'address':address,
    'country':country,
    'city':city,
    'img':imgUrl,
    'dob':dob,


  }).then((value) {

    print('Profile data updated');

  }).catchError((onError){

    print('Failed to Update data');

  });



}





static AddData()async{

  FirebaseUser loggedinUser;


  try {
    final user = await _auth.currentUser();
    if (user != null) {
      loggedinUser = user;
      print(loggedinUser.uid);
      myuserid = loggedinUser.uid;
    }
  } catch (e) {
    print(e);
  }


  final QuerySnapshot resultQuery=await Firestore.instance
  .collection(type).where(myuserid).getDocuments();

  final List<DocumentSnapshot> documentSnapshot=resultQuery.documents;

  print(documentSnapshot.length);
  if(documentSnapshot.length==0)
   {

     Firestore.instance.collection(type).document(myuserid).setData({

       'name':name,
       'email':email,
       'phone_number':phoneNumber,
       'address':address,
       'country':country,
       'city':city,
       'img':imgUrl,
       'dob':dob,


     }).then((value) {

       print('data added');

     }).catchError((onError){

       print('Failed to add data');

     });

   }








}



}