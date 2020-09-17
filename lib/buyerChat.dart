import 'dart:async';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:comnt_app/CRUD.dart';
import 'package:flutter/material.dart';
class BuyerChat extends StatefulWidget {


  @override
  _BuyerChatState createState() => _BuyerChatState();
}

class _BuyerChatState extends State<BuyerChat> {
  final messageTextController = TextEditingController();
  Map<String,dynamic> mymap;
  StreamSubscription<QuerySnapshot>subscription;

  List<DocumentSnapshot>comments;

  final CollectionReference collectionReference=
  Firestore.instance.collection("chats");



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscription = collectionReference.orderBy('timestamp', descending: true).snapshots()
        .listen((datasnapshot) {
      setState(() {
        comments = datasnapshot.documents;
      });
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    subscription?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,),
      body: Stack(
        children: <Widget>[
          comments!=null?
          ListView.builder(
              reverse: true,
              padding: EdgeInsets.symmetric(vertical: 40),
              physics: BouncingScrollPhysics(),
              itemCount: comments.length,
              itemBuilder: (BuildContext ctxt, int index) {



                String comment=comments[index].data['cmnt'];
                String name=comments[index].data['name'];
                print(comment);
                print(name);
                return CommentCard(name,comment);

              }
//
//              CommentCard(),
//              CommentCard(),
//              CommentCard(),
//              CommentCard(),
//              CommentCard(),
//              CommentCard(),







          ):new Center(
              child: new CircularProgressIndicator()),


          Align(
            alignment: Alignment.bottomCenter,
            child: Container(

              child: Row(children: <Widget>[

                Expanded(
                  child:

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Material(
                      elevation: 4.0,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: TextField(
                        controller: messageTextController,
                        onChanged: (String value){
                          mymap={
                            "cmnt": value,
                            "name":"ali",
                            'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),

                          };
                        },
                        cursorColor: Colors.blue,
                        decoration: InputDecoration(
                            hintText: "Write Comment",

                            border: InputBorder.none,
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                      ),
                    ),
                  ),

                ),

                InkWell(
                  onTap: (){
                    WriteComment(mymap);
                    messageTextController.clear();
                  },
                  child: Icon(Icons.send,color: Colors.black,
                    size: 35,),
                )

              ],),
            ),
          )

        ],

      ),
    );
  }


  Widget CommentCard(name , comment)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(

          children: <Widget>[

            CircleAvatar(child:
            Image.network("https://cdn2.iconfinder.com/data/icons/ui-v-1-circular-glyph/48/UI_v.1-Circular-Glyph-20-512.png"),
              backgroundColor: Colors.white70,
              radius: 30,
            ),
            SizedBox(width: 20,),
            Text(name,style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 20
            ))

          ],),



        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
              elevation: 10,
              color: Colors.deepPurple,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(comment

                  ,style: TextStyle(fontSize: 18,
                      color: Colors.white
                  ),

                ),
              )),
        ),
        Divider(height: 15,color: Colors.black,
          thickness: 1,),

      ],);
  }


  Future<void> WriteComment(imgData) async {
    collectionReference
        .add(imgData).catchError((e) {
      print(e);
    });

  }

}