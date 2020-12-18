/*
 * *
 *  * Created by Arley Mauricio Duarte, arleymauricio@gmail.com on 3/22/20 1:29 PM
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 3/22/20 1:29 PM
 *
 */

import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  static void show(BuildContext context, {Key key}) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) => LoadingDialog(key: key),
    );
  }

  static void hide(BuildContext context) {
    Navigator.pop(context);
  }

  LoadingDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Card(
          child: Container(
            width: 80,
            height: 80,
            padding: EdgeInsets.all(12.0),
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}