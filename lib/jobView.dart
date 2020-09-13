import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class JobView extends StatefulWidget {
  @override
  _JobViewState createState() => _JobViewState();

  String img;
  String title;
  String description;
  String price;
  String time;
  JobView(this.img,this.title,this.description,this.price);

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
                child: FittedBox(
                  child: Image.network(widget.img,





                  ),


                  fit: BoxFit.fill,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.indigoAccent, Colors.deepPurple],
                  ),
                ),
              height:260,
                width: double.infinity,
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
    height: MediaQuery.of(context).size.height/2.2,
    child: ListView(
physics: BouncingScrollPhysics(),
      children: <Widget>[

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[

            Text("Title",style: heading,),
            SizedBox(height: 8,),
            Text(widget.title,style: TextStyle(
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 12,),
            Text("Description",style: heading,),
            SizedBox(height: 8,),
            Text(widget.description),
            SizedBox(height: 8,),
            Text("Price",style: heading,),
            SizedBox(height: 8,),
            Text(widget.price),


            SizedBox(height: 15,),
//            Row(
//              children: <Widget>[
//
//                Text("Upload Your CV",style: TextStyle(color: Colors.indigo,
//
//                fontWeight: FontWeight.bold
//
//                ),),
//
//
//                IconButton(
//                  tooltip: "Upload Your CV",
//                  icon: Icon(FontAwesomeIcons.upload),
//                  onPressed: (){}
//                  ,
//                  color: Colors.indigoAccent,
//                ),
//              ],
//            )

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

    