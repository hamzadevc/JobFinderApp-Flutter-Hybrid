import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class CreateGig extends StatefulWidget {
  @override
  _CreateGigState createState() => _CreateGigState();
}

class _CreateGigState extends State<CreateGig> {
  File _image;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body:Container(
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

},
  color: Colors.purple,

)
          ],),
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
  
}
