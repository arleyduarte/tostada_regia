/*
 * *
 *  * Created by Arley Mauricio Duarte, arleymauricio@gmail.com on 3/27/20 10:19 AM
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 3/27/20 10:19 AM
 *
 */



class OrderDetail {



    String productId;
    String quantity;
    String specialInstructions;
    String unitPrice;

    OrderDetail({  this.productId, this.quantity, this.specialInstructions, this.unitPrice});

    factory OrderDetail.fromJson(Map<String, dynamic> json) {
        return OrderDetail(


            productId: json['productId'], 
            quantity: json['quantity'], 
            specialInstructions: json['specialInstructions'], 
            unitPrice: json['unitPrice'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();

        data['productId'] = this.productId;
        data['quantity'] = this.quantity;
        data['specialInstructions'] = this.specialInstructions;
        data['unitPrice'] = this.unitPrice;

        return data;
    }
}