import 'package:cleaningapp/widget/selected_cleaning.dart';
import 'package:flutter/material.dart';
import 'package:cleaningapp/constant/ColorScheme.dart';
import 'package:cleaningapp/CalendarPage.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'ubuntu',
      ),
      debugShowCheckedModeBanner: false,
      home: mainPage(),

    );
  }
}
class mainPage extends StatefulWidget {
  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  String selectedType = "initial";
  String selectedFrequency = "monthly";
  @override
  Widget build(BuildContext context) {
    double ScreenHeight = MediaQuery.of(context).size.height;
    double ScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: purple,
      appBar: AppBar(
        title: Text("Your Plan", style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700
        ),),
        elevation: 0,
        backgroundColor: Colors.transparent,

      ),
      body: Container(
        height: ScreenHeight,
        // decoration: BoxDecoration(border: Border.all(color: Colors.red,width: 2)),
        child: ListView(
          children: [
                 Container(
                      width: MediaQuery.of(context).size.width,
                      height: ScreenHeight,
                      padding: EdgeInsets.only(top: 10,left: 10,right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                          color: Colors.white
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text("Selected Cleaning", style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),

                          SizedBox(height: 10,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: (){changeCleaningType("initial");},

                                  child: Column(
                                    children: [
                                      SelectedCleaning("asset/image/img1.png", "Initial Cleaning", selectedType, ScreenHeight, ScreenWidth),
                                      Container(
                                        height: ScreenHeight*0.07,
                                        width: ScreenWidth*0.07,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xffededed),
                                        ),
                                        child: (selectedType == "initial") ? Icon(Icons.check_circle,
                                          color: pink,
                                          size: ScreenHeight*0.03,):Container(),
                                      )
                                    ],
                                  )
                              ),
                              GestureDetector(
                                  onTap: (){changeCleaningType("upkeep");},
                                  child: Column(
                                    children: [
                                      SelectedCleaning("asset/image/img2.png", "Upkeep Cleaning", selectedType, ScreenHeight, ScreenWidth),
                                      Container(
                                        height: ScreenHeight*0.07,
                                        width: ScreenWidth*0.07,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xffededed),
                                        ),
                                        child: (selectedType == "upkeep") ? Icon(Icons.check_circle,
                                          color: pink,
                                          size: ScreenHeight*0.03,):Container(),
                                      )
                                    ],
                                  )
                              )
                            ],
                          ),
                          Text("Selected Frequency", style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),
                          SizedBox(height: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: (){changeFrequency("daily");},
                                  child: Container(
                                    height: 50,
                                    width: ScreenWidth*.25,
                                    decoration: (selectedFrequency == "daily") ? BoxDecoration(
                                        color: pink,
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ) : BoxDecoration(
                                        border: Border.all(color: Colors.black.withOpacity(0.3)),
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: Center(
                                      child: Text("Daily", style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: (selectedFrequency == "daily") ? Colors.white : Colors.black
                                      ),),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){changeFrequency("weekly");},
                                  child: Container(
                                    height: 50,
                                    width: ScreenWidth*.25,
                                    decoration: (selectedFrequency == "weekly") ? BoxDecoration(
                                        color: pink,
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ) : BoxDecoration(
                                        border: Border.all(color: Colors.black.withOpacity(0.3)),
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: Center(
                                      child: Text("Weekly", style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: (selectedFrequency == "weekly") ? Colors.white : Colors.black
                                      ),),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){changeFrequency("monthly");},
                                  child: Container(
                                    height: 50,
                                    width: ScreenWidth*.25,
                                    decoration: (selectedFrequency == "monthly") ? BoxDecoration(
                                        color: pink,
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ) : BoxDecoration(
                                        border: Border.all(color: Colors.black.withOpacity(0.3)),
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: Center(
                                      child: Text("Monthly", style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: (selectedFrequency == "monthly") ? Colors.white : Colors.black
                                      ),),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text('Selected Extras',style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),
                          SizedBox(height: 10,),
                          Container(
                            height: 90,
                            // decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2)),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                extraWidget("fridge", "Inside Fridge", true),
                                SizedBox(width: 10,),
                                extraWidget("organise", "Organise", false),
                                SizedBox(width: 10,),
                                extraWidget("blind", "Small Blinds", false),
                                SizedBox(width: 10,),
                                extraWidget("garden", "Patio", false),
                                SizedBox(width: 10,),
                                extraWidget("organise", "Grocery", true),
                                SizedBox(width: 10,),
                                extraWidget("blind", "Curtains", false),
                              ],
                            ),
                          ),

                          SizedBox(height: 10,),

                          Center(
                            child: GestureDetector(
                              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>CalendarPage())),
                              child: Container(
                                width: ScreenWidth*0.4,
                                height: ScreenHeight*0.07,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: purple,

                                ),
                                child: Center(
                                  child: Text("Next", style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600
                                  ),textAlign: TextAlign.center,),
                                ),
                              ),
                            ),
                          )
                        ],
                      )

                  ),



          ],
        ),
      )
    );
  }
  void changeCleaningType(String type)
  {
    selectedType = type;
    setState(() {

    });
  }
  void changeFrequency(String frequency)
  {
    selectedFrequency = frequency;
    setState(() {

    });
  }
  Column extraWidget(String img, String name, bool isSelected)
  {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: purple
              ),
              child: Container(
                margin: EdgeInsets.all(17),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('asset/image/icons/$img.png'),
                    fit: BoxFit.contain
                  )
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: (isSelected == true) ? Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white
                ),
                child: Center(
                  child: Icon(
                    Icons.check_circle,
                    color: pink,
                  ),
                ),
              ):Container(),
            ),
          ],
        ),
        SizedBox(height: 5,),
        Text(name, style: TextStyle(
          fontWeight: FontWeight.w500
        ),)
      ],
    );
  }
}

