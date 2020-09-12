import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:path/path.dart' as Path;
import 'CRUD.dart';
class CreateGig extends StatefulWidget {
  @override
  _CreateGigState createState() => _CreateGigState();
}

class _CreateGigState extends State<CreateGig> {
  File _image;
  String title;
  String description;
  String time;
  String price;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body:ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Container(
margin: EdgeInsets.only(top: 15),
            child: ListView(

              physics:BouncingScrollPhysics(),
                padding: EdgeInsets.all(11),

                children: [
Center(
  child:   Text("Add Image That Shows your Gig",style: TextStyle(
fontWeight: FontWeight.bold,
      fontSize: 22)),
),
                  SizedBox(height: 20,),
              Card(
                elevation: 10,
                child: Container(
                  height: 250,
                  width:double.infinity,
                  child:
                  InkWell(
                    onTap: (){
                      chooseFile();
                    },
                    child:
                    _image==null?
                    Image.asset('assets/images/add.png',

                      fit: BoxFit.cover,
                    ):
                        Image.file(_image)
                  )
                  ,),
              ),
SizedBox(height: 20,),
              Text("Add title",style: TextStyle(
                  fontSize: 22)),
                  SizedBox(height: 20,),
              TextField(

                onChanged: ((value){
                  title=value;
                }),
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(color: Colors.grey[800]),
                    hintText: "e.g : I will create Wordpress website for u",
                    fillColor: Colors.white70),
              ),
                  SizedBox(height: 20,),
              Text("Add Description",style: TextStyle(
                  fontSize: 22)),
                  SizedBox(height: 20,),
              TextField(
                onChanged: ((value){
                  description=value;
                }),
                maxLines: 10,
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(color: Colors.grey[800]),
                    hintText: "Type in your text",
                    fillColor: Colors.white70),
              ),
                  SizedBox(height: 20,),
              Text("Time",style: TextStyle(
                fontSize: 22

              ),),
                  SizedBox(height: 20,),
              TextField(

                onChanged: ((value){
                  time=value;
                }),
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(color: Colors.grey[800]),
                    hintText: "e.g 20 days",
                    fillColor: Colors.white70),
              ),
                  SizedBox(height: 20,),
                  Text("Price \$",style: TextStyle(
                      fontSize: 22

                  ),),
                  SizedBox(height: 20,),
              TextField(
                onChanged: ((value){
                  price=value;
                }),
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(color: Colors.grey[800]),
                    hintText: "e.g:50",
                    fillColor: Colors.white70),
              ),
                  SizedBox(height: 20,),
RaisedButton(

  elevation: 12,
  child:Text("Create",
style: TextStyle(color: Colors.white,fontSize: 23),
),
onPressed: (){

    if(title==null || description==null || time==null || _image==null || price== null)
      {


        Fluttertoast.showToast(msg: "All fields are required");


      }
    else{

      UploadGig();

    }




},
  color: Colors.purple,

)
            ],),
          ),
        )


      ),
    );
  }
  void chooseFile() async {
    File selected = await ImagePicker.pickImage(source: ImageSource.gallery);

    this.setState(() {
      _image = selected;
      print(_image);
    });

//    setState(() {
//      showSpinner = true;
//    });

//    StorageReference storageReference = FirebaseStorage.instance
//        .ref()
//        .child('Recent/${Path.basename(_image.path)}}');
//    StorageUploadTask uploadTask = storageReference.putFile(_image);
//    await uploadTask.onComplete;
//    print('File Uploaded');
//    storageReference.getDownloadURL().then((fileURL) {
//      setState(() {
//        _uploadedFileURL = fileURL;
//        print(fileURL);
//        CRUD.imgurl = fileURL;
//        showSpinner = false;
//      });
//    });
  }



  UploadGig()async{

setState(() {
  showSpinner=true;
});

String gigImg;

        StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('Recent/${Path.basename(_image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
     gigImg=fileURL;
        print(gigImg);

       // showSpinner = false;
      });
    });





   await Firestore.instance.collection("Gigs").document().setData({
      'create_id':CRUD.myuserid,
      'create_img':CRUD.imgUrl,
      'create_name':CRUD.name,
      'gig_img':gigImg,
      'title':title,
      'description':description,
      'time':time,
      'price':price,
      'type':'programming'

    })
        .then((value) {

      print('gig data added');

    }).catchError((onError){

      print('Failed to add data');

    });
setState(() {
  showSpinner=false;
});


//    Firestore.instance.collection(type).document(myuserid).setData({
//
//      'name':name,
//      'email':email,
//      'phone_number':phoneNumber,
//      'address':address,
//      'country':country,
//      'city':city,
//      'img':imgUrl,
//      'dob':dob,
//
//
//    })
//    .then((value) {
//
//      print('data added');
//
//    }).catchError((onError){
//
//      print('Failed to add data');
//
//    });
  }
}
