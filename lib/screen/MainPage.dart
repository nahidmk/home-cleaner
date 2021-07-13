import 'package:cleaningapp/widget/date_time_picker.dart';
import 'package:cleaningapp/widget/selected_cleaning.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:cleaningapp/constant/ColorScheme.dart';
import 'package:cleaningapp/screen/CalendarPage.dart';

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
  bool _fridge = false;
  bool _organise = false;
  bool _blinds = false;
  bool _patio = false;
  bool _grocery = false;
  bool _curtains = false;

  String _date = '';
  String _time = '';

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = MediaQuery.of(context).size.height;
    double ScreenWidth = MediaQuery.of(context).size.width;


    void ShowData(){
      String data = "Cleaning Type : $selectedType Cleaning\n"
          "Cleaning Frequency : $selectedFrequency \n"
          "Extras Cleaning : ${!_blinds?'':"Blinds,"} "
          "${!_curtains?'':"Curtains,"} "
          "${!_fridge?'':"Fridge,"} "
          "${!_organise?'':"Organise,"} "
          "${!_grocery?'':"Grocery,"} "
          "${!_patio?'':"Patio,"} \n"
          "Date : $_date \n"
          "Time : $_time \n";
      print('data : $data');
    }

      void setDateTime(String date, String time){
        setState(() {
          _date = date;
          _time = time;
        });
      }


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
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 10,left: 10,right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            color: Colors.white
        ),
        // decoration: BoxDecoration(border: Border.all(color: Colors.red,width: 2)),
        child: ListView(
          children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20,),
                          Text("Selected Cleaning", style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),

                          SizedBox(height: 20,),

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
                          SizedBox(height: 20,),
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
                          SizedBox(height: 20,),
                          Text('Select Extras',style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),
                          SizedBox(height: 20,),
                          Container(
                            height: 90,
                            // decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2)),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      _fridge = !_fridge;
                                    });
                                  },
                                  child: extraWidget("fridge", "Inside Fridge", _fridge),
                                ),
                                SizedBox(width: 10,),

                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      _organise = !_organise;
                                    });
                                  },
                                  child: extraWidget("organise", "Organise", _organise),
                                ),

                                SizedBox(width: 10,),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      _blinds = !_blinds;
                                    });
                                  },
                                  child: extraWidget("blind", "Small Blinds", _blinds),
                                ),

                                SizedBox(width: 10,),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      _patio = !_patio;
                                    });
                                  },
                                  child: extraWidget("garden", "Patio", _patio),
                                ),

                                SizedBox(width: 10,),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      _grocery = !_grocery;
                                    });
                                  },
                                  child: extraWidget("organise", "Grocery", _grocery),
                                ),

                                SizedBox(width: 10,),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      _curtains = !_curtains;
                                    });
                                  },
                                  child: extraWidget("blind", "Curtains", _curtains),
                                ),

                              ],
                            ),
                          ),

                          SizedBox(height: 20,),
                          Text('Select Date and time',style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600
                          ),),

                          SizedBox(height: 20,),
                          DateTimePicker(setDateTime: setDateTime,),

                          SizedBox(height: 20,),


                          Center(
                            child: GestureDetector(
                              onTap: (){
                                ShowData();
                                Navigator.pop(context);

                              },
                              child: Container(
                                width: ScreenWidth*0.4,
                                height: ScreenHeight*0.07,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: purple,

                                ),
                                child: Center(
                                  child: Text("Save", style: TextStyle(
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



