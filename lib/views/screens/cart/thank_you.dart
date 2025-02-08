import 'package:flutter/material.dart';
import 'package:furitshop/controller/order.dart';
import 'package:furitshop/controller/payment.dart';
import 'package:furitshop/views/screens/Home/bottonnavigarion.dart';
import 'package:furitshop/views/widgets/check_circle_avatar.dart';
import 'package:furitshop/views/widgets/dashed_line.dart';
import 'package:furitshop/views/widgets/payment_scuess_screen.dart';
import 'package:get/get.dart';


class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});
  void delayedAction(BuildContext context) {
    Future.delayed(Duration(seconds: 3) , () {
        Ordercontroller().placeOrder();
        PaymentController().clear() ;
        Get.offAll(() => BottomNavigation() ,transition: Transition.fade , duration: Duration(milliseconds: 650 ));
    });
  }
  @override
  Widget build(BuildContext context) {
    delayedAction(context) ;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 10),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.grey[200]),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 43.0 + 16, left: 22, right: 22),
                  child: ContentColumn(),
                ),
              ),
              Positioned(
                  bottom: .2 * MediaQuery.sizeOf(context).height,
                  left: -20,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                  )),
              Positioned(
                  bottom: .2 * MediaQuery.sizeOf(context).height,
                  right: -20,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                  )),
              CheckCircleAvatar(),
              DashedLine()
            ],
          ),
        ),
      ),
    );
  }
}
