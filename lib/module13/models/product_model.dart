import 'package:flutter/foundation.dart';

class ProductModel {
  late String id;
  late String productName;
  late int productCode;
  late String img;
  late int qty;
  late int unitPrice;
  late int totalPrice;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    productName = json['ProductName'];
    productCode = json['ProductCode'];
    img = json['Img'];
    qty = json['Qty'];
    unitPrice = json['UnitPrice'];
    totalPrice = json['TotalPrice'];
  }
}
