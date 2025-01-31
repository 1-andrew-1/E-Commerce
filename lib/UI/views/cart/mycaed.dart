import 'package:flutter/material.dart';
import 'package:furitshop/UI/views/cart/card%20count/card_widget.dart';
import 'package:furitshop/UI/views/cart/card%20count/emptyscreen.dart';
import 'package:furitshop/UI/views/home/controller/homecontroller.dart';
import 'package:furitshop/UI/views/home/widgets/addtocartbutton.dart';
import 'package:get/get.dart';

class Mycaed extends StatelessWidget {
  const Mycaed({super.key});

  @override
  Widget build(BuildContext context) {
    final Homecontroller controller = Get.put(Homecontroller());
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        backgroundColor: Colors.green[300],
      ),
      body: Obx(
         () {
          return controller.cart.isEmpty ? 
            EmptyCartScreen(
              imageName: "images/shopping.png", 
              title: "The cart is empty", subTitle: 
              "Go find the product you like", buttonText: 
              "Go Back", 
              onButtonPressed: () {
                Get.back();
              }
            )
          : Column(
            children: [
              Expanded(
                child: Obx(
                  () => ListView.builder(
                      itemCount: controller.cart.length, // Use the length of your data list to show all items.
                      itemBuilder: (context, index) {
                        int count = controller.cart[index]['id']?.value; 
                        print("==========================$count");
                        var data = controller.data![count];
                        var rate = data["rating"]["rate"];
                        return CartWidgt(
                          photo: "${data["image"]}",
                          title: "${data["title"]}",
                          price: "${data["price"]}",
                          rating: rate.toDouble(),
                          id: data["id"],
                          index: index,
                        );
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30 ,
                  right: 30,
                  bottom: 15,
                  top: 10
                ),
                child: const Divider(),
              ),
              Obx(
                () {
                  double total = 0;
                  for (int index = 0; index < controller.cart.length; index++) {
                    var item = controller.cart[index];
                    int count = item['id'].value;
                    var data = controller.data![count];
                    int c = controller.cart[index]['quantity'].value;
                    total += c * double.parse(data["price"].toString());
                  }
                  return Addtocartbutton(
                    onPressed: () {
                      // cash or visa
                    },
                    iconData: Icons.payment_sharp,
                    text: 'Total: \$ ${total.toStringAsFixed(2)}',
                  );
                },
              ),
              SizedBox(
                height: 30,
              )
            ],
          );
        }
      ),
    );
  }
}
