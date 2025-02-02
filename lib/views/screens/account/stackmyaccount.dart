import 'package:flutter/material.dart';
import 'package:furitshop/controller/controller.dart';
import 'package:furitshop/core/defaultsize/sizeconig.dart';
import 'package:get/get.dart';
class Stackmyaccount extends StatefulWidget {
  const Stackmyaccount({super.key});

  @override
  State<Stackmyaccount> createState() => _StackmyaccountState();
}

class _StackmyaccountState extends State<Stackmyaccount> {
  Countcontroller c = Countcontroller() ;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
       Container(
        height: Sizeconig.defaultsize! * 26,
        decoration: BoxDecoration(
          color: Colors.green,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ]
        ),
       ),
       Positioned(
        top: Sizeconig.defaultsize! * 3.5,
        left: Sizeconig.defaultsize! * 2,
        child:IconButton(onPressed: () {Get.back() ;}, icon: Icon(Icons.arrow_back , color: Colors.white, ) ) 
       ) ,
       Positioned(
        top: Sizeconig.defaultsize! * 3.5,
        right: Sizeconig.defaultsize! * 2,
        child:IconButton(onPressed: () {
          c.pickImageFromGallery() ;
        }, icon: Icon(Icons.photo , color: Colors.white, ) ) 
       ) ,
       Positioned(
         top: Sizeconig.defaultsize! * 5,
         left: Sizeconig.defaultsize! * 14,
         child: 
         Container( 
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(65),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ]
          ),
           child: CircleAvatar(
              maxRadius: 70,
              minRadius: 50,
              backgroundImage: c.selectedImage.isNull ?AssetImage(
                "images/WhatsApp Image 2024-10-02 at 01.07.18_2361e04b.jpg", 
              ) : AssetImage(c.selectedImage.toString())  ,
            ),
         ),
       ),
       Positioned(
         top: Sizeconig.defaultsize! * 20.5,
         left: Sizeconig.defaultsize! * 14,
         child: Text(
           "Andrew nassar" ,
           style: TextStyle(
            color: Colors.white,
            fontSize: Sizeconig.defaultsize! * 2.2 ,
           ),
         )
       ),
      ],
    );
  }
}