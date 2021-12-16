import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvc_flutter/controllers/cart_controller.dart';
import 'package:getx_mvc_flutter/controllers/controller.dart';
class HomePage extends StatelessWidget {

  ///this is controller initialized we can use it in this page.
  //var myController=MyController();

  /// if we want to use controller multiple page we use dependancey injection.
  var myController=Get.put(MyController());
  var cartController=Get.put(CartController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child:GetX<MyController>(
                  builder: (controller) {
                    return ListView.builder(
                        itemCount: controller.products.length,
                        itemBuilder: (context,index){
                          var product=controller.products[index];
                      return Card(
                        child: Column(
                          children: [
                            Text(product.name,style: const TextStyle(fontSize: 18,color: Colors.black),),
                            Text(product.desc,style: const TextStyle(fontSize: 12,color: Colors.black),),
                            Text(product.price.toString(),style: const TextStyle(fontSize: 18,color: Colors.black),),
                            ElevatedButton(
                                onPressed: (){
                                  cartController.addToCart(
                                    myController.products[index]
                                  );
                                },
                                child:const Text('Add To Cart',style: TextStyle(
                                  color: Colors.white,
                                  backgroundColor: Colors.blue,
                                ),)
                            ),
                          ],
                        ),
                      );
                    });
                  }
                ),
            ),
            GetX<CartController>(
              builder: (controller) {
                return Text('Total Amount:  \$ ${controller.totalPrice}');
              }
            ),
            const SizedBox(height: 100,),
          ],
        ),
      ),
      floatingActionButton:
      FloatingActionButton.extended(onPressed: (){

      },
          icon: const Icon(Icons.add_shopping_cart_rounded),
          label: GetX<CartController>(
            builder: (controller) {
              return Text(controller.count.toString());
            }
          )),
    );
  }
}
