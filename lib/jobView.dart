import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class JobView extends StatefulWidget {
  @override
  _JobViewState createState() => _JobViewState();
}

class _JobViewState extends State<JobView> {
  TextStyle infoStyle=TextStyle(fontSize: 15,fontWeight: FontWeight.bold,
      color: Colors.white);
  TextStyle infoStyle1=TextStyle(fontSize: 15,
      color: Colors.white);

  TextStyle heading=TextStyle(fontSize: 25,fontWeight: FontWeight.bold,
      color: Colors.black);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,
      bottomNavigationBar: Padding(

        padding: const EdgeInsets.all(8.0),
        child: FlatButton(

          splashColor: Colors.blueAccent,
          shape:   RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          onPressed: ()
          {
//            Navigator.push(
//              context,
//              MaterialPageRoute(builder: (context) => JobView()),
//            );
          },
          color: Colors.deepPurple,
          child:
          Text("Purchase",style: infoStyle,),
        ),
      ),
      body: Column(


        children: <Widget>[
          Stack(
            children: <Widget>[

              Container(
                child: Image.network("https://i.pinimg.com/originals/f8/f6/56/f8f656fd473305405d82d4a64f777a85.jpg",
                  fit: BoxFit.cover,

                  width: double.infinity

                  ,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.indigoAccent, Colors.deepPurple],
                  ),
                ),
              height:230,
              ),



Positioned(
  left: 20,
  top: 40,
  child:   Align(

      alignment: Alignment.bottomLeft,
      child: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(FontAwesomeIcons.arrowLeft,color: Colors.black,
          size: 30,))),
)

            ],
          ),


Padding(
  padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
  child:   Container(
    height: MediaQuery.of(context).size.height/2,
    child: ListView(
physics: BouncingScrollPhysics(),
      children: <Widget>[

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[

            Text("Google",style: heading,),
            SizedBox(height: 8,),
            Text("Flutter developer Required",style: TextStyle(
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 12,),
            Text("Description",style: heading,),
            SizedBox(height: 8,),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"),
            SizedBox(height: 8,),
            Text("Qualifications",style: heading,),
            SizedBox(height: 8,),
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit"

                "Lorem ipsum dolor sit amet, consectetur adipiscing elit"

                "Lorem ipsum dolor sit amet, consectetur adipiscing elit"),


            SizedBox(height: 15,),
            Row(
              children: <Widget>[

                Text("Upload Your CV",style: TextStyle(color: Colors.indigo,

                fontWeight: FontWeight.bold

                ),),


                IconButton(
                  tooltip: "Upload Your CV",
                  icon: Icon(FontAwesomeIcons.upload),
                  onPressed: (){}
                  ,
                  color: Colors.indigoAccent,
                ),
              ],
            )

          ],),




      ],



    ),
  ),
)
,


        ],
      ),
    );
  }
}

    