/*
 * *
 *  * Created by Arley Mauricio Duarte, arleymauricio@gmail.com on 3/21/20 4:00 PM
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 3/21/20 4:00 PM
 *
 */

import 'package:flutter/material.dart';
import 'package:tostada_regia/config/constants.dart';
import 'package:tostada_regia/ux/colors.dart';





Widget getBigButton(String textButton) {
  return Container(
      margin: const EdgeInsets.only(top: 5),
      child: SizedBox(
          width: 300,
          child: RaisedButton(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: kCorporateColor)),
            onPressed: () {},
            color: kCorporateColor,
            textColor: Colors.white,
            child:
                Text(textButton, style: TextStyle(fontSize: 14)),
          )));
}

Widget getBottomMessage(String message){
  return Container(
    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
    child: Column(
      children: <Widget>[
        Text(message, style: TextStyle(fontSize: 14, color: Colors.white))
      ],
    ),
  );
}

Widget inCenterContainer(BuildContext context, Widget widget, double sideCut) {
  var sizeW = MediaQuery.of(context).size.width;
  var leftCut = sideCut;
  var rightCut = sideCut;
  if (sizeW > WEB_MAX_WIDTH) {
    leftCut = (sizeW - WEB_MAX_WIDTH) / 4;
    rightCut = leftCut;
  }

  print("sizeW $sizeW rightCut $rightCut");

  return Center(
      child: Container(
        margin: EdgeInsets.only(right: rightCut, left: leftCut),
        child: widget,
      ));
}