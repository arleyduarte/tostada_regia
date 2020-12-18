import 'package:flutter/material.dart';
import 'package:tostada_regia/ux/app_locations.dart';

class BackgroundScreen extends StatelessWidget {
  final Widget body;
  final Widget title;

  const BackgroundScreen({Key key, this.body, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: title,
        ),
        body: SafeArea(
            child: Container(
          constraints: BoxConstraints.expand(),
          child: DecoratedBox(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/menu_background.png"),
                      fit: BoxFit.cover)),
              child: Container(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 20.0,
                  ),
                  child: this.body,
                ),
              )),
        )));
  }
}

