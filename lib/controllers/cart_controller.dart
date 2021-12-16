import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_mvc_flutter/models/product.dart';

class CartController extends GetxController{
  var cartItems=<Product>[].obs;

  //this will be initialized as property which will return total amount of products in cart.
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
  //this property to count the number of items in cart
  int get count => cartItems.length;
  addToCart(Product product){
    cartItems.add(product);
  }
}