import 'package:flutter/material.dart';
import 'package:furitshop/views/screens/splash%20view%F0%9F%A4%A6%E2%80%8D%E2%99%80%EF%B8%8F/splash_view/custom_items_body.dart';

class Custompageview extends StatelessWidget  {
  const Custompageview({super.key,@required this.pageController});

  final PageController ? pageController ;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController ,
      children: const [
          Customitemsbody(
            images: 'images/Screenshot_2024-09-13_013435-removebg-preview.png' ,
            text1: 'E Shopping' , 
            text2: 'Export top organic products',
         ) ,
          Customitemsbody(
            images: 'images/Screenshot_2024-09-13_013448-removebg-preview.png' ,
            text1: 'Delivery on the way ' , 
            text2: 'Get the order on the way' ,
         ) ,
          Customitemsbody(
            images: 'images/Screenshot_2024-09-13_013530-removebg-preview.png' ,
            text1: 'Delivery arrived ' ,  
            text2: 'Order is arrived at your place',
         ) ,
      ],
    );
  }
}