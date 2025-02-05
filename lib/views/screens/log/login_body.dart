import 'package:flutter/material.dart';
import 'package:furitshop/controller/authcontroller.dart';
import 'package:furitshop/core/defaultsize/sizeconig.dart';
import 'package:furitshop/views/widgets/custom_button.dart';
import 'package:furitshop/views/widgets/spacher.dart';
import 'package:get/get.dart';

class Loginbody extends StatefulWidget {
  const Loginbody({super.key});
  @override
  State<Loginbody> createState() => _LoginbodyState();
}

class _LoginbodyState extends State<Loginbody> {
  @override
  Widget build(BuildContext context) {
    final Authcontroller auth = Get.put(Authcontroller()) ;
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:  [
        const Heightspace(value: 8) ,
        Image.asset(
          'images/smartphone.png',
          height: Sizeconig.defaultsize! * 25,
        ),
        const Text(
          'El-Shaikh Marzouk Market',
          style: TextStyle(
              fontSize: 34, fontWeight: FontWeight.w900, color: Color(0xFF818FB4)),
          textAlign: TextAlign.center,
        ),
        Authbutton(
          imageauth: 'images/google.png',
          textauth: 'Continue with Google',
          onPressed: () async  {
            await auth.signInWithGoogle() ;
          },
        ),
        
        Authbutton(
          imageauth: 'images/facebook.png',
          textauth: 'Continue with Facebook',
          onPressed: () async  {
            await auth.signInWithFacebook() ;
          }
        ),
         const Wighetspace(value: 5),
      ],
    ));
  }
}
