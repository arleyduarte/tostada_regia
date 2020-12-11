/*
 * *
 *  * Created by Arley Mauricio Duarte, arleymauricio@gmail.com on 3/23/20 4:52 PM
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 3/23/20 4:52 PM
 *
 */

import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:flutter/foundation.dart' as fundation;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tostada_regia/models/restaurant.dart';
import 'package:tostada_regia/models/shopping_cart_item.dart';

import 'access_token.dart';
import 'credit_cart.dart';
import 'customer.dart';
import 'dish.dart';
import 'extension_helper.dart';
import 'order.dart';


const String USER_INFO_KEY = "adf";
const String CREDIT_CARD_KEY = "x3df";
const String CUSTOMER_INFO_KEY = "cadf";

enum MAIN_MENU_ACTION {ORDER_TO_GO, EXPLORE_MENU}



class SessionManager {
  final logger = Logger();
  final sKey = 'my 32 length key................';
  final iv = IV.fromLength(16);

  SessionManager._privateConstructor();

  static final SessionManager instance = SessionManager._privateConstructor();

  AccessToken _accessToken;

  CreditCard creditCard;
  Customer customer;
  List<Restaurant> restaurants = List<Restaurant>();
  List<Dish> dishes = List<Dish>();
  Restaurant currentRestaurant;
  Dish selectedDish = Dish();
  List<Dish> filteredDishes = List<Dish>();
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  ShoppingCarItem toRemoveItem;
  Order currentOrder = Order();

  bool showLoggingFromHome = false;

  bool showRestaurantsFromConfirmation = false;


  var menuSelectedAction = MAIN_MENU_ACTION.ORDER_TO_GO;

  saveAccessToken(AccessToken accessToken) {
    this._accessToken = accessToken;

    Map<String, dynamic> user = jsonDecode(accessToken.customer);
    var customer = Customer.fromJsonFromLogin(user);



    saveCustomer(customer);
  }

  saveCustomer(Customer customerAux) async {
    this.customer = customerAux;
    logger.d("saveCustomer ${customer.toJson()}");
    var bodyEncode = json.encode(customer.toJson());
    SharedPreferences prefs = await _prefs;
    await prefs.setString(CUSTOMER_INFO_KEY, bodyEncode);
  }

  saveCreditCard(CreditCard creditCard) async {
    this.creditCard = creditCard;

    if(fundation.kIsWeb){
      return;
    }


    logger.d("saveCreditCard ${creditCard.toJson()}");
    var bodyEncode = json.encode(creditCard.toJson());

    final key = Key.fromUtf8(sKey);
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(bodyEncode, iv: iv);

    String encryptedString = encrypted.base64;

    SharedPreferences prefs = await _prefs;
    await prefs.setString(CREDIT_CARD_KEY, encryptedString);
  }

  Future<CreditCard> restoreCreditCard() async {

    if(fundation.kIsWeb){
      creditCard = CreditCard();
      return creditCard;
    }


    if (creditCard == null || isNullOrEmpty(creditCard.number)) {


      try{
        SharedPreferences prefs = await _prefs;
        String encryptedString = prefs.get(CREDIT_CARD_KEY);
        logger.d("encryptedString $encryptedString");



        final key = Key.fromUtf8(sKey);
        final encrypter = Encrypter(AES(key));
        final decrypted =
        encrypter.decrypt(Encrypted.fromBase64(encryptedString), iv: iv);

        JsonCodec _codec = new JsonCodec();
        creditCard = CreditCard.fromJson(_codec.decode(decrypted));
      }catch(e){
        logger.e(e);
        creditCard = CreditCard();

      }


    }




    if (customer != null && isNullOrEmpty(creditCard.address)) {
      creditCard.address = customer.address;
      creditCard.zip = customer.zip;
      creditCard.state = customer.stateUS;
      creditCard.city = customer.city;
    }




    logger.d("restoreCreditCard ${creditCard.toJson()}");

    return creditCard;
  }

  Future<Customer> restoreCustomer() async {
    if (customer == null) {
      try {
        SharedPreferences prefs = await _prefs;
        String response = prefs.get(CUSTOMER_INFO_KEY);
        JsonCodec _codec = new JsonCodec();
        customer = Customer.fromJson(_codec.decode(response));
      } catch (e) {
        return null;
      }
    }

    print("restoreCustomer ${customer.toJson()}");

    return customer;
  }

  void logout() async {
    customer = new Customer();
    customer.name = "";
    logger.d("logout");

    await saveCustomer(customer);
    restoreCustomer();
  }


}
