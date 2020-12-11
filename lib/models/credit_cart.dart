/*
 * *
 *  * Created by Arley Mauricio Duarte, arleymauricio@gmail.com on 3/26/20 4:04 PM
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 3/26/20 4:04 PM
 *
 */



class CreditCard {
    String address="";
    String city="";
    String cvv="";
    String mm="";
    String number="";
    String state="";
    String yyyy="";
    String zip="";

    CreditCard({this.address, this.city, this.cvv, this.mm, this.number, this.state, this.yyyy, this.zip});

    factory CreditCard.fromJson(Map<String, dynamic> json) {
        return CreditCard(
            address: json['address'], 
            city: json['city'], 
            cvv: json['cvv'], 
            mm: json['mm'], 
            number: json['number'], 
            state: json['state'], 
            yyyy: json['yyyy'], 
            zip: json['zip'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['address'] = this.address;
        data['city'] = this.city;
        data['cvv'] = this.cvv;
        data['mm'] = this.mm;
        data['number'] = this.number;
        data['state'] = this.state;
        data['yyyy'] = this.yyyy;
        data['zip'] = this.zip;
        return data;
    }
}