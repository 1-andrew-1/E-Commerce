import 'package:flutter/material.dart';
import 'package:furitshop/controller/homecontroller.dart';
import 'package:furitshop/core/defaultsize/sizeconig.dart';
import 'package:furitshop/views/widgets/custom_button.dart';
import 'package:get/get.dart';

class Appbarhomepage extends StatelessWidget {
  Appbarhomepage({super.key});
  final Homecontroller _HomeController = Get.put(Homecontroller());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: Sizeconig.defaultsize! * 20, // Height of the green header
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.green, // Green background color
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'El-Shaikh Marzouk Market',
                      style: TextStyle(
                        fontSize: Sizeconig.defaultsize! * 2.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    IconButtonWidget(
                      name: Icons.notifications,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: Sizeconig.defaultsize! * 13, // Adjust the position of the search bar
              left: Sizeconig.defaultsize! * 2,
              right: Sizeconig.defaultsize! * 2,
              child: Container(
                height: Sizeconig.defaultsize! * 5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0, // Shadow effect
                      offset: Offset(0, 5), // Shadow position
                    ),
                  ],
                ),
                child:  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          onChanged: _HomeController.updateSearch,
                          controller: _HomeController.searchingtext,
                          decoration: InputDecoration(
                            hintText: "Search",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none, // Remove the underline
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
