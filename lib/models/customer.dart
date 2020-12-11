/*
 * *
 *  * Created by Arley Mauricio Duarte, arleymauricio@gmail.com on 3/26/20 5:57 PM
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 3/26/20 5:23 PM
 *
 */



class Customer {
    String address;
    String city;
    String email;
    int id;
    String name;
    String phone;
    String stateUS;
    String zip;
    String password;

    Customer({this.address, this.city, this.email, this.id, this.name, this.phone, this.stateUS, this.zip, this.password});

    factory Customer.fromJson(Map<String, dynamic> json) {
        return Customer(
            address: json['address'],
            city: json['city'],
            email: json['email'],
            id: json['id'],
            name: json['name'],
            phone: json['phone'],
            stateUS: json['stateUS'],
            zip: json['zip'],
            password: json['password'],
        );
    }


    factory Customer.fromJsonFromLogin(Map<String, dynamic> json) {
        return Customer(
            address: json['Address'],
            city: json['City'],
            email: json['Email'],
            id: json['Id'],
            name: json['Name'],
            phone: json['Phone'],
            stateUS: json['StateUS'],
            zip: json['Zip'],
            password: json['password'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['address'] = this.address;
        data['city'] = this.city;
        data['email'] = this.email;
        data['id'] = this.id;
        data['name'] = this.name;
        data['phone'] = this.phone;
        data['stateUS'] = this.stateUS;
        data['zip'] = this.zip;
        data['password'] = this.password;
        return data;
    }


}