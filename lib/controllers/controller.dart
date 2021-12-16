import 'dart:async';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_mvc_flutter/models/product.dart';

class MyController extends GetxController{
  var products=<Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  void fetchProduct() async{
    await Future.delayed(const Duration(seconds: 1));
    var responseResult=[
      Product(1, 'Product 1', 'This is Shoes', 'Pic Url', 24.5),
      Product(1, 'Product 2', 'This is pants', 'Pic Url', 44.5),
      Product(1, 'Product 3', 'This is Shirts', 'Pic Url', 56),
      Product(1, 'Product 5', 'This is Froutes', 'Pic Url', 29.9),
      Product(1, 'Product 6', 'This is something', 'Pic Url', 100.9)

    ];
    products.value=responseResult;

  }
}