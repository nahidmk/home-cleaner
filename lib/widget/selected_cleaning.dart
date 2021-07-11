import 'package:cleaningapp/constant/ColorScheme.dart';
import 'package:flutter/material.dart';


Widget SelectedCleaning(String img, String title, String selectedType, double ScreenHeight,double ScreenWidth){

  return Column(
    children: [
      Container(
        height: ScreenHeight*0.2,
        width: ScreenWidth*0.43,
        decoration: BoxDecoration(
          color: Color(0xffdfdeff),
          image: DecorationImage(
            image: AssetImage(img),
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      SizedBox(height: 5,),
      Text(title, style: TextStyle(
          fontWeight: FontWeight.w600
      ),),
      SizedBox(height: 5,),

    ],
  );

}