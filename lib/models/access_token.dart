/*
 * *
 *  * Created by Arley Mauricio Duarte, arleymauricio@gmail.com on 3/23/20 4:49 PM
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 3/23/20 4:49 PM
 *
 */



class AccessToken {
    String access_token;
    String customer;
    String customerId;

    AccessToken({this.access_token, this.customer, this.customerId});

    factory AccessToken.fromJson(Map<String, dynamic> json) {
        return AccessToken(
            access_token: json['access_token'], 
            customer: json['customer'], 
            customerId: json['customerId'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['access_token'] = this.access_token;
        data['customer'] = this.customer;
        data['customerId'] = this.customerId;
        return data;
    }
}