import 'package:flutter/material.dart';

import 'colors.dart';

final titleStyle =  new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0, color: Colors.black);
final titleGreyStyle =  new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0, color: Colors.grey);
final title2Style =  new TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.black);
final subTitleStyle =  new TextStyle(fontWeight: FontWeight.normal, fontSize: 14.0, color: Colors.grey);
final subTitleCorporate =  new TextStyle(fontWeight: FontWeight.normal, fontSize: 14.0, color: kCorporateColor);
final bodyStyle =  new TextStyle(fontWeight: FontWeight.normal, fontSize: 14.0, color: Colors.grey);
final smallerStyle =  new TextStyle(fontWeight: FontWeight.normal, fontSize: 12.0, color: Colors.grey);


final ThemeData tostadaTheme = ThemeData.light().copyWith(

  appBarTheme: AppBarTheme(
    color: kCorporateColor,

  )
  ,
  primaryTextTheme: TextTheme(
      headline6: TextStyle(
          color: Colors.white
      )
  ),
  brightness: Brightness.light,
  primaryColor: Colors.red,
  //primarySwatch: Colors.orange, // or Colors.green or any color darker than white (this is line 66)
  accentColor: Colors.orange,
);


