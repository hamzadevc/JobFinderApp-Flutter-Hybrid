import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:job_application/jobView.dart';
class GigList extends StatefulWidget {
  @override
  _GigListState createState() => _GigListState();
}

class _GigListState extends State<GigList> {
  bool isSearch=false;

  StreamSubscription <QuerySnapshot>subscription;

  List<DocumentSnapshot>gigs;
  final CollectionReference collectionReference=
  Firestore.instance.collection("Gigs");


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscription = collectionReference.snapshots()
        .listen((datasnapshot) {
      setState(() {
        gigs = datasnapshot.documents;
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

      appBar: AppBar(

        actions: <Widget>[
          isSearch ?
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,

              child: IconButton(
                onPressed: () {
                  setState(() {
                    isSearch = false;
                  });
                },
                icon: new FaIcon(

                  FontAwesomeIcons.timesCircle,),
              ),
            ),
          ) :
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,

              child: IconButton(
                onPressed: () {
                  setState(() {
                    isSearch = true;
                  });
                },
                icon: new FaIcon(

                  FontAwesomeIcons.search,),
              ),
            ),
          )


        ],


        flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [Colors.indigoAccent, Colors.deepPurple],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
        title: !isSearch ? Text("A Freelancer", style: TextStyle(
            fontFamily: 'Spicy Rice'
        ),

        ) : Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: TextField(
            onChanged: (value) {
              // myfilter(value);

            },
            style: TextStyle(color: Colors.white, fontSize: 18),

            decoration: InputDecoration(hintText: "Search Gigs",
              hintStyle: TextStyle(
                  color: Colors.white
              ),
              icon: new Icon(Icons.search, color: Colors.white,),

              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white70),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),


          ),
        )

        , centerTitle: true,

      ),

      body:
      gigs != null ?
      ListView.builder(
        cacheExtent: 10000.0,
      physics: BouncingScrollPhysics(),
        itemCount: gigs.length,
        itemBuilder: (BuildContext ctxt, int index) {
          String personName;
          String personimg;
          String title = gigs[index].data['title'];
          String description = gigs[index].data['description'];
          String price = gigs[index].data['price'];
          String creatorId = gigs[index].data['create_id'];
          String gigImg = gigs[index].data['gig_img'];
//  String imgPath=posts[index].data['img'];
//  String imgPath=posts[index].data['img'];
          print(title);
          print(description);
          print(price);
          print(creatorId);
          print(gigImg);

          return StreamBuilder(


              stream: Firestore.instance.collection("seller").where(
                  'id', isEqualTo: creatorId
              ).limit(1).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
//   for(int index=0;index<snapshot.data.documents.length;index++)
//    {
//     if(snapshot.data.documents[index]['id']==creatorId)
//      {

                  personName = snapshot.data.documents[0]['name'];
                  personimg = snapshot.data.documents[0]['img'];
                  print(snapshot.data.documents[0]['name']);
//      }
//    }
                  return gigCard(
                      gigImg, personName, personimg, title, price, description);
                  print(personimg);
                  print(personName);
                }
                else {
                  return Center(child: CircularProgressIndicator());
                }
              }


          );
        },


//        gigCard(),
//        gigCard(),
//        gigCard(),
//        gigCard(),
//        gigCard()


      ) :
      new Center(
          child: new CircularProgressIndicator()),

    );
  }
  Widget gigCard(gigimg,pname,pImg,title,price,description)
  {

    return InkWell(

      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => JobView(
            gigimg,title,description,price


          )),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(10.0),
          side: new BorderSide(color: Colors.black, width: 1.0),
        ),
        elevation: 20,
        child: Container(


            width: double.infinity,
            child:
            Column(children: [


              Container(
                height: 250,
              width: double.infinity,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.network(gigimg,





                  ),
                ),
              ),

              Divider(color: Colors.black,
                thickness: 1,),
              Row(children: [

//                CircleAvatar(
//
//                  child:
//                Image.network(pImg),
//                  backgroundColor: Colors.white,
//                  radius: 30,
//
//                ),


                Container(
                  margin: EdgeInsets.only(left: 15),
                    width: 50.0,
                    height: 50.0,
                    decoration: new BoxDecoration(
                      shape: BoxShape
                          .circle,
                      image: new DecorationImage(
                        image: new NetworkImage(
                            pImg),
                        fit: BoxFit.cover,
                      ),
                    )),


                SizedBox(width: 15,),
                Text(pname,style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 22
                ))

              ],),
              SizedBox(height: 10,),
              Text(title,style: TextStyle(
                  fontSize: 20
              )),

              SizedBox(height: 15,),

              Padding(
                padding: const EdgeInsets.only(bottom: 15,right: 15),
                child: Align(

                  alignment: Alignment.centerRight,
                  child: Text("$price dollars",style: TextStyle(fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                      fontSize: 20
                  )),
                ),
              ),
            ],)
        ),
      ),
    );



  }
}
