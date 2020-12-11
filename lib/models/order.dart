/*
 * *
 *  * Created by Arley Mauricio Duarte, arleymauricio@gmail.com on 3/27/20 10:19 AM
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 3/27/20 10:19 AM
 *
 */



import 'dart:convert';

import 'order_detail.dart';

class Order {

    String customerId;
    String deliveryAddress;

   // int id;
    List<OrderDetail> orderDetails = List<OrderDetail>();
    String orderStateId;
    String paid;
    String paidNumber;
    String restaurantId;
    String specialInstructions;
    String subTotal;
    String tax;
    String time;
    String total;
    String type;
    String email;


    Order({ this.customerId, this.deliveryAddress,   this.orderDetails, this.orderStateId, this.paid, this.paidNumber, this.restaurantId, this.specialInstructions, this.subTotal, this.tax, this.time, this.total, this.type, this.email});

    factory Order.fromJson(Map<String, dynamic> json) {
        return Order(

            customerId: json['customerId'], 
            deliveryAddress: json['deliveryAddress'], 

           // id: json['id'],
            orderDetails: json['orderDetails'] != null ? (json['orderDetails'] as List).map((i) => OrderDetail.fromJson(i)).toList() : null, 
            orderStateId: json['orderStateId'], 
            paid: json['paid'], 
            paidNumber: json['paidNumber'], 
            restaurantId: json['restaurantId'], 
            specialInstructions: json['specialInstructions'], 
            subTotal: json['subTotal'], 
            tax: json['tax'], 
            time: json['time'], 
            total: json['total'], 
            type: json['type'],
            email: json['email'],

        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();

        data['customerId'] = this.customerId;
        data['deliveryAddress'] = this.deliveryAddress;

        //data['id'] = this.id;
        data['orderStateId'] = this.orderStateId;
        data['paid'] = this.paid;
        data['paidNumber'] = this.paidNumber;
        data['restaurantId'] = this.restaurantId;
        data['specialInstructions'] = this.specialInstructions;
        data['subTotal'] = this.subTotal;
        data['tax'] = this.tax;
        data['time'] = this.time;
        data['total'] = this.total;
        data['type'] = this.type;
        data['email'] = this.email;

        if (this.orderDetails != null) {

            data['sOrderDetails'] =  json.encode(this.orderDetails);
            //data['orderDetails'] = this.orderDetails.map((v) => v.toJson()).toList();
        }
        return data;
    }
}