/*
 * *
 *  * Created by Arley Mauricio Duarte, arleymauricio@gmail.com on 3/21/20 11:10 AM
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 3/21/20 11:10 AM
 *
 */

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:tostada_regia/config/constants.dart';
import 'package:tostada_regia/models/extension_helper.dart';
import 'package:tostada_regia/models/session_manager.dart';
import 'package:tostada_regia/restaurants/restaurants_bloc.dart';
import 'package:tostada_regia/widgets/generic_widgets.dart';

import 'home_button.dart';

enum HOME_ACTION { LOGIN, LOGOUT }

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final logger = Logger();
  var _action = HOME_ACTION.LOGIN;

  void _showSignUp() {
    if (_action == HOME_ACTION.LOGOUT) {
      SessionManager.instance.logout();
      Navigator.pushNamedAndRemoveUntil(context, "/", (r) => false);
    } else {
      print("logout");
      _showLoginForm();
      //
    }
  }

  _showRestaurants() {
    Navigator.pushNamed(context, "/restaurants");
  }

  _showMenu() {
    SessionManager.instance.menuSelectedAction = MAIN_MENU_ACTION.EXPLORE_MENU;
    _showRestaurants();
  }

  _showLoginForm() {
    SessionManager.instance.showLoggingFromHome = true;
    Navigator.pushNamed(context, "/loggin");
  }

  _showOrder() async {
    print("_showOrder");
    var customer = await SessionManager.instance.restoreCustomer();
    if (customer == null || isNullOrEmpty(customer.name)) {
      _showLoginForm();
    } else {
      SessionManager.instance.menuSelectedAction = MAIN_MENU_ACTION.ORDER_TO_GO;
      _showRestaurants();
    }
  }

  @override
  Widget build(BuildContext context) {
    String _getButtonName() {
      print("_getButtonName ");
      var customer = SessionManager.instance.customer;

      if (customer == null || isNullOrEmpty(customer.name)) {
        print("_getButtonName customer is null");
        _action = HOME_ACTION.LOGIN;
        return "Login";
      } else {
        print("_getButtonName customer NOT null");

        _action = HOME_ACTION.LOGOUT;
        return "${customer.name} Logout";
      }
    }

    final Widget buttonsContainer = Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          HomeButton(
            imageName: "images/find_menu.png",
            onPressed: _showRestaurants,
          ),
          HomeButton(
            imageName: "images/order_menu.png",
            onPressed: _showOrder,
          ),
          HomeButton(
            imageName: "images/explore_menu.png",
            onPressed: _showMenu,
          )
        ],
      ),
    );

    Widget getNearestRestaurant() {
      var restaurant = SessionManager.instance.currentRestaurant;
      if(restaurant == null){
        return getBottomMessage("");
      }

      String address = restaurant != null ? restaurant.address : "";

      return getBottomMessage(
          "Your current selected location is ${restaurant.name}, located at ${address}. To avoid delays please make sure to confirm or change it when placing your order. Thanks");
    }

    Widget getBodyPage() {
      return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            Center(
                child: Image.asset(
              'images/logo.png',
              height: 200,
              width: 200,
              fit: BoxFit.fill,
            )),
            buttonsContainer,
            getNearestRestaurant()
          ],
        ),
      );
    }

    Widget waitingPage = Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          Center(
              child: Image.asset(
            'images/logo.png',
            height: 200,
            width: 200,
            fit: BoxFit.fill,
          )),
          SizedBox(
            height: 20,
          ),
          Center(child: CircularProgressIndicator())
        ],
      ),
    );

    Widget signUpIcon() {
      return GestureDetector(
          onTap: () {
            _showSignUp();
          },
          child: Center(
            child: Container(
                margin: const EdgeInsets.only(right: 10),
                child: Text(
                  _getButtonName(),
                  style: TextStyle(color: Colors.white),
                )),
          ));
    }

    Widget loadingPage() {

      return Scaffold(
        appBar: AppBar(
          title: Text(kAppName),
          actions: <Widget>[signUpIcon()],
        ),
        body: Center(
            child: DecoratedBox(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/menu_background.png"),
                  fit: BoxFit.cover)),
          child: waitingPage,
        )),
      );
    }

    Widget loadedPage() {

      return Scaffold(
        appBar: AppBar(
          title: Text(kAppName),
          actions: <Widget>[signUpIcon()],
        ),
        body: Center(
            child: DecoratedBox(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/menu_background.png"),
                  fit: BoxFit.cover)),
          child: getBodyPage(),
        )),
      );
    }

    return  BlocProvider(
        create: (context) => RestaurantsBloc()..add(FetchRestaurantsEvent()),
        child: BlocBuilder<RestaurantsBloc, RestaurantsState>(
            builder: (context, state){

              if(state is RestaurantsLoadInProgress){
                return loadingPage();
              }
              if(state is RestaurantsLoadSuccess){
                  return loadedPage();
              }


            }
        )
    );;
  }
}
