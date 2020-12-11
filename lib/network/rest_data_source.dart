/*
 * *
 *  * Created by Arley Mauricio Duarte, arleymauricio@gmail.com on 3/23/20 4:39 PM
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 3/23/20 4:39 PM
 *
 */

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tostada_regia/models/access_token.dart';
import 'package:tostada_regia/models/order.dart';
import 'package:tostada_regia/models/order_detail.dart';




class RestDataSource {
  static const baseUrl = 'https://online.tostadaregia.com//tostadaregia/api/';


  final httpClient = new http.Client();
  final JsonDecoder _decoder = new JsonDecoder();
  final logger = Logger();


  Future<AccessToken> authenticate(
      {@required username, @required password}) async {
    var url = '$baseUrl/token';

    if(kIsWeb){
      url =  "https://online.tostadaregia.com//apilogin/api/token";
    }

    final Map<String, String> body = {
      "grant_type": "password",
      "username": username,
      "password": password,
    };
    logger.d("path $url params: $body ");
    var response = await http.post(url, body: body);
    logger.d("path $url params: $body, response: ${response.body} ");

    if (response.statusCode != 200) {
      throw Exception('error getting weather for location');
    }

    return AccessToken.fromJson(_decoder.convert(response.body));
  }


  Future<bool> create(String service, Map<String, dynamic> body) async {
    final url = '$baseUrl/${service}';
    logger.d("path $url params: $body");
    var response = await http.post(url, body: body);
    logger.d("path $url params: $body, response: ${response.body} ");

    if (response.statusCode != 200) {
      return false;
    }

    return true;
  }


  Future<http.Response> createJson(String service,  Map<String, dynamic> data) async {
    final url = '$baseUrl/${service}';



    var body = json.encode(data);


    logger.d("path $url body: $body");
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body
    );
    logger.d("createJson response: ${response.body} ");
    return response;
  }



  Future<http.Response> post(String service, Map<String, dynamic> body) async {
    final url = '$baseUrl/${service}';
   // final url = 'http://test2amdp.azurewebsites.net/api/${service}';

    logger.d("path $url params: $body");
    var response = await http.post(url, body: body);
    logger.d("path $url params: $body, response: ${response.body} ");

    return response;
  }


  Future<String> testRequest2() async {


    var signUp = new Order();

   // signUp.id = 0;
    signUp.deliveryAddress = "Test email.value";
    signUp.orderStateId = 1.toString();
    signUp.customerId = 8597.toString();
    signUp.paid = "phone.value";
    signUp.paidNumber = "zip.value";
    signUp.restaurantId = 10.toString();
    signUp.specialInstructions = "city.value";
    signUp.subTotal = 10.2.toString();
    signUp.total = 10.2.toString();
    signUp.tax = 10.2.toString();
    signUp.time = "city.value";
    signUp.type = "1";


    var  od = OrderDetail();
    od.productId = 3.toString();
    od.quantity = 2.toString();
    od.unitPrice = 0.0.toString();
    od.specialInstructions = "x";
    List<OrderDetail> orderDetails = List<OrderDetail>();
    orderDetails.add(od);
    signUp.orderDetails = orderDetails;

    String varx = json.encode(orderDetails);


    print("74 $varx");

    var bodyValueX = signUp.toJson();

    print(" bodyValue ${bodyValueX}");



    final responseX = await post("order", bodyValueX);

    print("75");

    return "response.body";
  }







  Future<Iterable> fetch(String service) async {
    final url = '$baseUrl/${service}';
    logger.d("RestaurantsBloc path $url ");
    var response = await http.get(url);
    logger.d("path $url response: ${response.body} ");

    if (response.statusCode == 200) {
      return  json.decode(response.body);
    }

    return [];
  }
}
