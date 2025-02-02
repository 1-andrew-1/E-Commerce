import 'package:flutter/material.dart';
import 'package:furitshop/views/themes/appstyle.dart';
import 'package:furitshop/controller/homecontroller.dart';
import 'package:get/get.dart';


class Count extends StatelessWidget {
  const Count({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    //final Homecontroller c = Get.put(Homecontroller());
    return Container(
      height: 50, // Adjusted height for better layout
      width: 120, // Adjusted width for better layout
      padding: const EdgeInsets.all(8.0),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(10),
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.grey.shade300,
      //       blurRadius: 5,
      //       offset: Offset(0, 2),
      //     ),
      //   ],
      // ),
      child: 
          GetBuilder<Homecontroller>(builder: (c) => Row(
            children: [
              Expanded(child: Text("quantity" , style: Appstyle().countStyle,) ),
              Expanded(
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: TextEditingController(
                    text: c.cart[id]['quantity'].value.toString()),
                  keyboardType: TextInputType.number,
                  onSubmitted: (value) {
                      c.cart[id]['quantity'].value = int.parse(value);
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                    border: InputBorder.none
                  ),
                ),
              ),
            ],
          ),)
          // Increment Button 
      
    );
  }
}
