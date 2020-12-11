/*
 * *
 *  * Created by Arley Mauricio Duarte, arleymauricio@gmail.com on 3/24/20 12:41 PM
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 3/24/20 12:41 PM
 *
 */


class Dish {
    String description;
    String descriptonEs;
    int displayOrder;
    int id;
    String ingredients;
    String name;
    String photo;
    String price;
    String size;
    bool tortilla;
    int type;
    String typeName;

    Dish({this.description, this.descriptonEs, this.displayOrder, this.id, this.ingredients, this.name, this.photo, this.price, this.size, this.tortilla, this.type, this.typeName});

    factory Dish.fromJson(Map<String, dynamic> json) {
        return Dish(
            description: json['description'], 
            descriptonEs: json['descriptonEs'], 
            displayOrder: json['displayOrder'], 
            id: json['id'], 
            ingredients: json['ingredients'] != null ? json['size'] : "",
            name: json['name'], 
            photo: json['photo'], 
            price: json['price'], 
            size: json['size'] != null ? json['size'] : "",
            tortilla: json['tortilla'], 
            type: json['type'], 
            typeName: json['typeName'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['description'] = this.description;
        data['descriptonEs'] = this.descriptonEs;
        data['displayOrder'] = this.displayOrder;
        data['id'] = this.id;
        data['name'] = this.name;
        data['photo'] = this.photo;
        data['price'] = this.price;
        data['tortilla'] = this.tortilla;
        data['type'] = this.type;
        data['typeName'] = this.typeName;
        if (this.ingredients != null) {
            data['ingredients'] = this.ingredients;
        }
        if (this.size != null) {
            data['size'] = this.size;
        }
        return data;
    }

    int getPrice(){
        return 1;
    }
}