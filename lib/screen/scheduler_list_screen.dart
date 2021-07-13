import 'package:cleaningapp/screen/MainPage.dart';
import 'package:cleaningapp/constant/ColorScheme.dart';
import 'package:cleaningapp/database/database.dart';
import 'package:cleaningapp/model/cleaning.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SchedulerListScreen extends StatefulWidget {

  @override
  _SchedulerListScreenState createState() => _SchedulerListScreenState();
}

class _SchedulerListScreenState extends State<SchedulerListScreen> {


  List<Cleaning> cleaningList = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllCleanings();
  }

  Future getAllCleanings() async{
    setState(() {
      isLoading = true;
    });
    this.cleaningList = await SQLiteDbProvider.db.getAllCleanings();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purple,
      appBar: AppBar(
        title: Text('Work List',style: TextStyle(fontSize: 20,),),
        backgroundColor: Colors.transparent,
      ),
      body: isLoading?CupertinoActivityIndicator():
          Container(
            height: MediaQuery.of(context).size.height,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
              color: Colors.white,
            ),
            child: cleaningList.isEmpty?
            Center(
              child: Text(
                'You have no work Schedule yet',
                style: TextStyle(
                    fontSize: 15,fontFamily: 'ubuntu'),
              ),
            ):ListView(
              children: [
                ...cleaningList.map((cleaning){
                  return GestureDetector(
                    child: SchedulerCart(cleaning, context),
                    onTap: (){
                      print('id-->${cleaning.id}');
                      },
                  );
                })
              ],
            )
            ,
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>MainPage())),
        backgroundColor: purple,
        child: Icon(
          Icons.add,color: Colors.white,size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}


Widget SchedulerCart(Cleaning cleaning,BuildContext context){
  return Card(
    elevation: 3,
    child: Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('ID'),
              Text(cleaning.id.toString())
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Cleaning Type'),
              Text(cleaning.cleaningType)
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Date and Time'),
              Text(cleaning.dateTime)
            ],
          ),
        ],
      ),
    ),
  ) ;
}
