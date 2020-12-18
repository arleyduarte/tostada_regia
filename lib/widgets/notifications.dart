/*
 * *
 *  * Created by Arley Mauricio Duarte, arleymauricio@gmail.com on 3/22/20 1:30 PM
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 3/22/20 1:30 PM
 *
 */

import 'package:snack/snack.dart';
import 'package:flutter/material.dart';


class Notifications {
  Notifications._();

  static void showSnackBarWithError(BuildContext context, String message,
      {Key key}) {

    SnackBar(content: Text(message)).show(context);
  }

  static void showSnackBarWithSuccess(BuildContext context, String message,
      {Key key}) {
    SnackBar(content: Text('Hello, world showSnackBarWithSuccess!')).show(context);
  }
}