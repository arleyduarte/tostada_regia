/*
 * *
 *  * Created by Arley Mauricio Duarte, arleymauricio@gmail.com on 3/21/20 4:37 PM
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 3/21/20 4:37 PM
 *
 */

import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey();

  final Widget bodyPage = Container(
    margin: const EdgeInsets.only(top: 20),
    child: ListView(
      children: <Widget>[
        Center(
            child: Image.asset(
              'images/logo.png',
              height: 200,
              width: 200,
              fit: BoxFit.fill,
            )),



      ],
    ),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),

      ),
      body: Center(
          child: DecoratedBox(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/menu_background.png"),
                    fit: BoxFit.cover)),
            child: bodyPage,
          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}