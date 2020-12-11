/*
 * *
 *  * Created by Arley Mauricio Duarte, arleymauricio@gmail.com on 3/23/20 4:49 PM
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 3/23/20 4:49 PM
 *
 */



class Restaurant {
    String address = "";
    bool canOrderLater;
    int cityId;
    String ePNAccount;
    String ePNAccountPassword;
    String ePNAccountRestrictKey;
    bool hasDelivery;
    int id;
    bool isActive;
    bool isOpen;
    String latitude;
    String longitude;
    String name;
    String phoneNumber;


    Restaurant({this.address, this.canOrderLater, this.cityId, this.ePNAccount, this.ePNAccountPassword, this.ePNAccountRestrictKey, this.hasDelivery, this.id, this.isActive, this.isOpen, this.latitude, this.longitude, this.name, this.phoneNumber});

    factory Restaurant.fromJson(Map<String, dynamic> json) {
        return Restaurant(
            address: json['address'], 
            canOrderLater: json['canOrderLater'], 
            cityId: json['cityId'], 
            ePNAccount: json['ePNAccount'], 
            ePNAccountPassword: json['ePNAccountPassword'], 
            ePNAccountRestrictKey: json['ePNAccountRestrictKey'], 
            hasDelivery: json['hasDelivery'], 
            id: json['id'], 
            isActive: json['isActive'], 
            isOpen: json['isOpen'], 
            latitude: json['latitude'], 
            longitude: json['longitude'], 
            name: json['name'], 
            phoneNumber: json['phoneNumber'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['address'] = this.address;
        data['canOrderLater'] = this.canOrderLater;
        data['cityId'] = this.cityId;
        data['ePNAccount'] = this.ePNAccount;
        data['ePNAccountPassword'] = this.ePNAccountPassword;
        data['ePNAccountRestrictKey'] = this.ePNAccountRestrictKey;
        data['hasDelivery'] = this.hasDelivery;
        data['id'] = this.id;
        data['isActive'] = this.isActive;
        data['isOpen'] = this.isOpen;
        data['latitude'] = this.latitude;
        data['longitude'] = this.longitude;
        data['name'] = this.name;
        data['phoneNumber'] = this.phoneNumber;
        return data;
    }
}