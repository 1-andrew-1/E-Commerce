import 'package:flutter/material.dart';
import 'package:furitshop/features/widget/widget/sizeconig.dart';
import 'package:get/get.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({super.key, required this.imageName, required this.title, required this.subTitle, required this.buttonText, required this.onButtonPressed});
  final String imageName ;
  final String title;
  final String subTitle;
  final String buttonText;
  final VoidCallback onButtonPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding:  EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Shopping cart illustration
              Image.asset(
                imageName,
                height: Sizeconig.defaultsize! * 22,
              ),
              const SizedBox(height: 20),
              // "Oops..." text
              const Text(
                "Oops...",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 10),
              // "The cart is empty" text
              Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              // "Go find the product you like" text
              Padding(
                padding: const EdgeInsets.only(
                  left: 50,
                  right: 50,
                ),
                child: Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade600,
                    
                  ),textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 50),
              // "Go Shopping" button
              ElevatedButton(
                onPressed: () {
                 Get.back();
                  // Navigate to shopping page (Replace with actual navigation)
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[300],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  buttonText,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}