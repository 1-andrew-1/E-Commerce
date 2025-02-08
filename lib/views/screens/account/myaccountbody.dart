import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:furitshop/views/screens/Favourite/myfavourite.dart';
import 'package:furitshop/views/screens/Order/orderscreen.dart';
import 'package:furitshop/views/screens/cart/mycaed.dart';
import 'package:furitshop/core/services/services_setting.dart';
import 'package:furitshop/views/screens/log/login.dart';
import 'package:furitshop/views/screens/account/stackmyaccount.dart';
import 'package:furitshop/views/screens/account/thebutton.dart';
import 'package:furitshop/views/screens/setting/setting.dart';
import 'package:furitshop/views/widgets/spacher.dart';
import 'package:get/get.dart';

class Myaccountbody extends StatelessWidget {
  const Myaccountbody({super.key});

  @override
  Widget build(BuildContext context) {
    ServicesSetting servicesSetting = Get.put(ServicesSetting());
    return Scaffold(
      body: Column(
        children: [
          Stackmyaccount(),
          Heightspace(value: 2),
          Thebutton(
              ontap: () {
                Get.to(() => OrderScreen() , transition: Transition.fadeIn, duration: Duration(milliseconds: 650 ));
              },
              icon: Icons.shopping_bag,
              text: 'My Order'),
          Divider(),
          Thebutton(
              ontap: () {
                Get.to(() => Myfavourite() , transition: Transition.fadeIn, duration: Duration(milliseconds: 650 ));
              },
              icon: Icons.favorite,
              text: 'Favorite'),
          Divider(),
          Thebutton(
              ontap: () {
                Get.to(() => Setting() , transition: Transition.fadeIn, duration: Duration(milliseconds: 650 ));
              },
              icon: Icons.settings,
              text: 'Settings'),
          Divider(),
          Thebutton(
              ontap: () {
                Get.to(() => Mycaed() , transition: Transition.fadeIn, duration: Duration(milliseconds: 650 ));
              },
              icon: Icons.shopping_cart,
              text: 'Mycard'),
          Divider(),
          Thebutton(ontap: () {}, icon: Icons.rate_review, text: 'Rate us'),
          Divider(),
          Thebutton(ontap: () {}, icon: Icons.share, text: 'refer to friends'),
          Divider(),
          Thebutton(ontap: () {}, icon: Icons.help, text: 'Help'),
          Divider(),
          Thebutton(
              ontap: () {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.question,
                  animType: AnimType.scale,
                  title: 'Log Out ...',
                  desc: 'Are you sure you want to log out?',
                  btnCancelText: "Cancel",
                  btnOkText: "Yes, Logout",
                  btnCancelOnPress: () {},
                  btnOkOnPress: () async {
                    Get.dialog(
                      Center(child: CircularProgressIndicator()),
                      barrierDismissible: false,
                    );
                    await Future.delayed(
                        Duration(milliseconds: 500)); // Smooth transition
                    await servicesSetting.sharedPreferences.clear();
                    Get.offAll(() => Login(),
                        transition: Transition.fadeIn,
                        duration: Duration(milliseconds: 600));
                  },
                ).show();
              },
              icon: Icons.logout,
              text: 'Log out'),
        ],
      ),
    );
  }
}
