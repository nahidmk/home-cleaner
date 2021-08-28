import 'package:cleaningapp/constant/ColorScheme.dart';
import 'package:cleaningapp/database/database.dart';
import 'package:cleaningapp/model/cleaning.dart';
import 'package:cleaningapp/widget/date_time_picker.dart';
import 'package:cleaningapp/widget/selected_cleaning.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  bool _loadingCreateClean = false;
  String selectedType = "initial";
  String selectedFrequency = "monthly";
  bool _fridge = false;
  bool _organise = false;
  bool _blinds = false;
  bool _patio = false;
  bool _grocery = false;
  bool _curtains = false;

  List<String> _cleaningExtra;

  String _date = '';
  String _time = '';

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = MediaQuery.of(context).size.height;
    double ScreenWidth = MediaQuery.of(context).size.width;

    void saveData() async {
      Cleaning cleaning = Cleaning(
        cleaningExtra: _cleaningExtra,
        cleaningFrequency: selectedFrequency,
        cleaningType: selectedType,
        dateTime: "$_date $_time",
      );

      setState(() {
        _loadingCreateClean = true;
      });

      await SQLiteDbProvider.db.insertCleaning(cleaning);

      setState(() {
        _loadingCreateClean = false;
      });
      print('Cleaning Frequency=====>${cleaning.cleaningFrequency}\n'
          'Cleaning Type======> ${cleaning.cleaningType}\n'
          'Cleaning Date=======> ${cleaning.dateTime}\n'
          'Cleaning Extra =======> ${cleaning.cleaningExtra.map((e) => print(e))}');
    }

    void setDateTime(String date, String time) {
      setState(() {
        _date = date;
        _time = time;
      });
    }

    return Scaffold(
        backgroundColor: purple,
        appBar: AppBar(
          title: Text(
            "Your Plan",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          height: ScreenHeight,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: Colors.white),
          // decoration: BoxDecoration(border: Border.all(color: Colors.red,width: 2)),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Selected Cleaning",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            changeCleaningType("initial");
                          },
                          child: Column(
                            children: [
                              SelectedCleaning(
                                  "asset/image/img1.png",
                                  "Initial Cleaning",
                                  selectedType,
                                  ScreenHeight,
                                  ScreenWidth),
                              Container(
                                height: ScreenHeight * 0.07,
                                width: ScreenWidth * 0.07,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffededed),
                                ),
                                child: (selectedType == "initial")
                                    ? Icon(
                                        Icons.check_circle,
                                        color: pink,
                                        size: ScreenHeight * 0.03,
                                      )
                                    : Container(),
                              )
                            ],
                          )),
                      GestureDetector(
                          onTap: () {
                            changeCleaningType("upkeep");
                          },
                          child: Column(
                            children: [
                              SelectedCleaning(
                                  "asset/image/img2.png",
                                  "Upkeep Cleaning",
                                  selectedType,
                                  ScreenHeight,
                                  ScreenWidth),
                              Container(
                                height: ScreenHeight * 0.07,
                                width: ScreenWidth * 0.07,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffededed),
                                ),
                                child: (selectedType == "upkeep")
                                    ? Icon(
                                        Icons.check_circle,
                                        color: pink,
                                        size: ScreenHeight * 0.03,
                                      )
                                    : Container(),
                              )
                            ],
                          ))
                    ],
                  ),
                  Text(
                    "Selected Frequency",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            changeFrequency("daily");
                          },
                          child: Container(
                            height: 50,
                            width: ScreenWidth * .25,
                            decoration: (selectedFrequency == "daily")
                                ? BoxDecoration(
                                    color: pink,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))
                                : BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black.withOpacity(0.3)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                            child: Center(
                              child: Text(
                                "Daily",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: (selectedFrequency == "daily")
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            changeFrequency("weekly");
                          },
                          child: Container(
                            height: 50,
                            width: ScreenWidth * .25,
                            decoration: (selectedFrequency == "weekly")
                                ? BoxDecoration(
                                    color: pink,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))
                                : BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black.withOpacity(0.3)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                            child: Center(
                              child: Text(
                                "Weekly",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: (selectedFrequency == "weekly")
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            changeFrequency("monthly");
                          },
                          child: Container(
                            height: 50,
                            width: ScreenWidth * .25,
                            decoration: (selectedFrequency == "monthly")
                                ? BoxDecoration(
                                    color: pink,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))
                                : BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black.withOpacity(0.3)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                            child: Center(
                              child: Text(
                                "Monthly",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: (selectedFrequency == "monthly")
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Select Extras',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 90,
                    // decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 2)),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _fridge = !_fridge;
                            _fridge
                                ? setState(() {
                                    _cleaningExtra.add('Fridge');
                                  })
                                : setState(() {
                                    _cleaningExtra.remove('Fridge');
                                  });
                          },
                          child:
                              extraWidget("fridge", "Inside Fridge", _fridge),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            _organise = !_organise;

                            _organise
                                ? setState(() {
                                    _cleaningExtra.add('Organise');
                                  })
                                : setState(() {
                                    _cleaningExtra.remove('Organise');
                                  });
                          },
                          child: extraWidget("organise", "Organise", _organise),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            _blinds = !_blinds;
                            _blinds
                                ? setState(() {
                                    _cleaningExtra.add('Small Blinds');
                                  })
                                : setState(() {
                                    _cleaningExtra.remove('Small Blinds');
                                  });
                          },
                          child: extraWidget("blind", "Small Blinds", _blinds),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            _patio = !_patio;
                            _patio
                                ? setState(() {
                                    _cleaningExtra.add('Patio');
                                  })
                                : setState(() {
                                    _cleaningExtra.remove('Patio');
                                  });
                          },
                          child: extraWidget("garden", "Patio", _patio),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            _grocery = !_grocery;
                            _grocery
                                ? setState(() {
                                    _cleaningExtra.add('Grocery');
                                  })
                                : setState(() {
                                    _cleaningExtra.remove('Grocery');
                                  });
                          },
                          child: extraWidget("organise", "Grocery", _grocery),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            _curtains = !_curtains;
                            _curtains
                                ? setState(() {
                                    _cleaningExtra.add('Curtains');
                                  })
                                : setState(() {
                                    _cleaningExtra.remove('Curtains');
                                  });
                          },
                          child: extraWidget("blind", "Curtains", _curtains),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Select Date and time',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DateTimePicker(
                    setDateTime: setDateTime,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _loadingCreateClean
                      ? Center(child: CupertinoActivityIndicator())
                      : Center(
                          child: GestureDetector(
                            onTap: () {
                              saveData();
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: ScreenWidth * 0.4,
                              height: ScreenHeight * 0.07,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: purple,
                              ),
                              child: Center(
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )
            ],
          ),
        ));
  }

  void changeCleaningType(String type) {
    selectedType = type;
    setState(() {});
  }

  void changeFrequency(String frequency) {
    selectedFrequency = frequency;
    setState(() {});
  }

  Column extraWidget(String img, String name, bool isSelected) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(shape: BoxShape.circle, color: purple),
              child: Container(
                margin: EdgeInsets.all(17),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('asset/image/icons/$img.png'),
                        fit: BoxFit.contain)),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: (isSelected == true)
                  ? Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Center(
                        child: Icon(
                          Icons.check_circle,
                          color: pink,
                        ),
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          name,
          style: TextStyle(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
