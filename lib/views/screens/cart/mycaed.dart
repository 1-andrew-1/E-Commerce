import 'package:flutter/material.dart';
import 'package:furitshop/controller/order.dart';
import 'package:furitshop/controller/payment.dart';
import 'package:furitshop/payment/Payment%20Stripe/Models/payment_intent_input_model.dart';
import 'package:furitshop/views/screens/cart/card%20count/card_widget.dart';
import 'package:furitshop/views/screens/cart/card%20count/emptyscreen.dart';
import 'package:furitshop/controller/homecontroller.dart';
import 'package:furitshop/views/screens/cart/card%20count/location.dart';
import 'package:furitshop/views/screens/cart/thank_you.dart';
import 'package:furitshop/views/widgets/addtocartbutton.dart';
import 'package:get/get.dart';

class Mycaed extends StatelessWidget {
  const Mycaed({super.key});
  @override
  Widget build(BuildContext context) {
    final PaymentController paymentController = Get.put(PaymentController());
    final Homecontroller controller = Get.put(Homecontroller());
    final Ordercontroller ordercontroller = Get.put(Ordercontroller());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        backgroundColor: Colors.green[300],
        automaticallyImplyLeading: true ,
      ),
      body: Obx(() {
        return controller.cart.isEmpty
            ? EmptyCartScreen(
                imageName: "images/shopping.png",
                title: "The cart is empty",
                subTitle: "Go find the product you like",
                buttonText: "Go Back",
                onButtonPressed: () {
                  Get.back();
                })
            : Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Location(),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: controller.cart
                            .length, // Use the length of your data list to show all items.
                        itemBuilder: (context, index) {
                          int count = controller.cart[index]['id']?.value;
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
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, bottom: 15, top: 10),
                    child: const Divider(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () {
                          controller.calculateTotal();
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            alignment: Alignment.centerRight,
                            child: Text(
                              'Total: \$ ${controller.totalPrice.value.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 18),
                            ),
                          );
                        },
                      ),
                      Addtocartbutton(
                        onPressed: () async {
                          String ammount = (controller.totalPrice.value * 100)
                              .toInt()
                              .toString();
                          //print(
                          //    "==================================================${paymentController.paymentSuccess.value}");
                          await paymentController.makepayment(
                              paymentIntentInputModel: PaymentIntentInputModel(
                                  ammount: ammount, currencyCode: "USD"));
                          // print(
                          //    "==================================================${paymentController.paymentSuccess.value}");
                          if (paymentController.paymentSuccess.value == true) {
                            // code of async Ordering
                            ordercontroller.placeOrder() ;
                            Get.to(() => PaymentSuccessScreen());
                          }
                        },
                        iconData: Icons.payment,
                        text: "Place Order",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              );
      }),
    );
  }
}
