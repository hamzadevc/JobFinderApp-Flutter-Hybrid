import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:job_application/jobView.dart';
class GigList extends StatefulWidget {
  @override
  _GigListState createState() => _GigListState();
}

class _GigListState extends State<GigList> {
  bool isSearch=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

appBar: AppBar(

  actions: <Widget>[
    isSearch?
    Padding(
      padding: const EdgeInsets.only(right:8.0),
      child: Align(
        alignment: Alignment.centerLeft,

        child: IconButton(
          onPressed: (){
            setState(() {

              isSearch=false;

            });

          },
          icon: new FaIcon(

            FontAwesomeIcons.timesCircle,),
        ),
      ),
    ):
    Padding(
      padding: const EdgeInsets.only(right:8.0),
      child: Align(
        alignment: Alignment.centerLeft,

        child: IconButton(
          onPressed: (){
            setState(() {

              isSearch=true;


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
  title: !isSearch? Text("Job Finder",style: TextStyle(
      fontFamily: 'Spicy Rice'
  ),

  ):Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: TextField(
      onChanged:(value){
        // myfilter(value);

      } ,
      style: TextStyle(color: Colors.white,fontSize: 18),

      decoration: InputDecoration(hintText:"Search Gigs",hintStyle:TextStyle(
          color: Colors.white
      ),
        icon: new Icon(Icons.search,color: Colors.white,),

        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white70),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),



    ),
  )

  ,centerTitle: true,

),
      body: ListView(


        physics: BouncingScrollPhysics(),
        children: [
        gigCard(),
        gigCard(),
        gigCard(),
        gigCard(),
        gigCard()


      ],),
    );
  }
  Widget gigCard()
  {

    return InkWell(

      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => JobView()),
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
                child: Image.network("https://i.pinimg.com/originals/f8/f6/56/f8f656fd473305405d82d4a64f777a85.jpg",
fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity

                  ,
                ),
              ),

              Divider(color: Colors.black,
                thickness: 1,),
              Row(children: [

                CircleAvatar(child:
                Image.network("https://cdn2.iconfinder.com/data/icons/ui-v-1-circular-glyph/48/UI_v.1-Circular-Glyph-20-512.png"),
                  backgroundColor: Colors.white70,
                  radius: 30,

                ),
                SizedBox(width: 15,),
                Text("Anonymous",style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 22
                ))

              ],),
              SizedBox(height: 10,),
              Text("I will Create Wordpress website for u",style: TextStyle(
                  fontSize: 20
              )),

              SizedBox(height: 15,),

              Padding(
                padding: const EdgeInsets.only(bottom: 15,right: 15),
                child: Align(

                  alignment: Alignment.centerRight,
                  child: Text("\$50 dollars",style: TextStyle(fontWeight: FontWeight.bold,
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
