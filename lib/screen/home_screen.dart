import 'package:cleaningapp/screen/MainPage.dart';
import 'package:cleaningapp/constant/ColorScheme.dart';
import 'package:cleaningapp/screen/scheduler_list_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {

    double ScreenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: purple,
      body: Column(
        children: [
          Container(
            width: 100,
            height: ScreenHeight*0.09,
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('asset/image/logo.png')
                )
            ),
          ),
          SizedBox(height: 15,),
          Text("Clean Home\nClean Life", style: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.w900
          ),textAlign: TextAlign.center,),

          SizedBox(height: 10,),

          Text("Book Cleans At The Comfort \nOf Your Home", style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w400,

          ), textAlign: TextAlign.center,),

          SizedBox(height: 20,),

          Container(
            height: ScreenHeight*0.4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('asset/image/splash.png'),
                    fit: BoxFit.fill
                )
            ),
          ),
          // Expanded(child: Container()),
          SizedBox(height: 30,),
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>SchedulerListScreen())),
                  child: Container(
                    height: ScreenHeight*0.1,
                    width: MediaQuery.of(context).size.width*.5,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:BorderRadius.only(topLeft: Radius.circular(30),bottomLeft: Radius.circular(30)),

                    ),
                    child: Center(child: Text('Continue...',style: TextStyle(fontSize: 20,color: purple),),),
                  ),
                )
              ]
          )
        ],
      ),
    );
  }

}

