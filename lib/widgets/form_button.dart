/*
 * *
 *  * Created by Arley Mauricio Duarte, arleymauricio@gmail.com on 3/22/20 1:32 PM
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 3/22/20 1:32 PM
 *
 */

import 'package:flutter/material.dart';
import 'package:tostada_regia/ux/colors.dart';


class FormButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final EdgeInsetsGeometry padding;
  const FormButton({
    Key key,
    @required this.onPressed,
    @required this.text,
    this.padding = const EdgeInsets.all(4.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 1, left: 10, right: 10, bottom: 2),
      child: SizedBox(
          width: 300,
          child: RaisedButton(
            padding: EdgeInsets.only(top: 1, bottom: 5),
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: kCorporateColor)),
            onPressed: onPressed,
            color: kCorporateColor,
            textColor: Colors.white,
            child:
            Text(text, style: TextStyle(fontSize: 14)),
          )),
    );
  }
}