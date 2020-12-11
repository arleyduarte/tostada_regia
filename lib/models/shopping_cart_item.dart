/*
 * *
 *  * Created by Arley Mauricio Duarte, arleymauricio@gmail.com on 3/25/20 6:26 PM
 *  * Copyright (c) 2020 . All rights reserved.
 *  * Last modified 3/25/20 6:26 PM
 *
 */





import 'dish.dart';

class ShoppingCarItem  {
  int quantity  = 0;
  String specialInstructions = "";
  String tortilla = "";
  Dish dish = new Dish();

  double getUnitPrice(){
    String unitPrice = dish.price != null ? dish.price : "0";
    unitPrice = unitPrice.replaceAll("\$", "");
    return double.parse(unitPrice);
  }
}