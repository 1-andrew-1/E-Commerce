import 'package:flutter/material.dart';
import 'package:furitshop/controller/order.dart';
import 'package:furitshop/views/screens/Home/bottonnavigarion.dart';
import 'package:furitshop/views/screens/cart/card%20count/emptyscreen.dart';
import 'package:get/get.dart';

class OrderScreen  extends StatelessWidget {
  const OrderScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    final Ordercontroller order = Get.put(Ordercontroller()) ;
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        backgroundColor: Colors.green[400],
      ),
      body: Obx(() {
        return order.orderList.isEmpty
            ? EmptyCartScreen(
                imageName: "images/shopping.png",
                title: "No Orders Yet!",
                subTitle: "Once you place an order, you'll see it here.",
                buttonText: "Browse Products",
                onButtonPressed: () {
                  Get.offAll(()=>BottomNavigation());
                })
            : Center(
              child: Text("andrew"),
            );
      })
    );
  }
}


//            Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.local_shipping, size: 100, color: Colors.grey),
//             SizedBox(height: 20),
//             Text(
//               "No Orders Yet!",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Once you place an order, you'll see it here.",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 16, color: Colors.grey),
//             ),
//             SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: () {
//                 Get.toNamed('/home'); // Navigate back to home or shop
//               },
//               child: Text("Browse Products"),
//             ),
//           ],
//         ),