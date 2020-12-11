/*
 * *
 *  * Created by Arley Mauricio Duarte, arleymauricio@gmail.com on 3/24/20 10:22 AM
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 3/24/20 10:22 AM
 *
 */

import 'package:flutter/material.dart';
import 'package:tostada_regia/ux/colors.dart';


class HomeButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String imageName;
  final EdgeInsetsGeometry padding;

  const HomeButton({
    Key key,
    @required this.onPressed,
    @required this.imageName,
    this.padding = const EdgeInsets.all(4.0),
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 5),
        child: SizedBox(
          width: 300,
          child: RaisedButton(
              padding: EdgeInsets.only(top: 5, bottom: 5),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: kCorporateColor)),
              onPressed: onPressed,
              color: kCorporateColor,
              textColor: Colors.white,
              child: Image.asset(
                imageName,
                height: 30,
                // width: 280,
                fit: BoxFit.fitWidth,
              )),
        ));
  }
}
