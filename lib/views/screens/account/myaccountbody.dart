import 'package:flutter/material.dart';
import 'package:furitshop/views/screens/Favourite/myfavourite.dart';
import 'package:furitshop/views/screens/cart/mycaed.dart';
import 'package:furitshop/core/services/services_setting.dart';
import 'package:furitshop/views/screens/log/login.dart';
import 'package:furitshop/views/screens/account/stackmyaccount.dart';
import 'package:furitshop/views/screens/account/thebutton.dart';
import 'package:furitshop/views/widgets/spacher.dart';
import 'package:get/get.dart';

class Myaccountbody extends StatelessWidget {
  const Myaccountbody({super.key});

  @override
  Widget build(BuildContext context) {
    ServicesSetting servicesSetting = Get.put(ServicesSetting()) ;
    return Scaffold(
      body: Column(
        children: [
          Stackmyaccount(),
          Heightspace( value: 2 ),
          Thebutton(ontap: () {}, icon: Icons.shopping_bag, text: 'My Order') ,
          Divider(),
          Thebutton(ontap: () {
            Get.to( () =>Myfavourite() ) ;
          }, icon: Icons.favorite, text: 'Favorite') ,
          Divider(),
          Thebutton(ontap: () {}, icon: Icons.settings, text: 'Settings') ,
          Divider() ,
          Thebutton(ontap: () {
            Get.to( () => Mycaed() ) ;
          }, icon: Icons.shopping_cart, text: 'Mycard'),
          Divider(),
          Thebutton(ontap: () { }, icon: Icons.rate_review, text: 'Rate us'),
          Divider() ,
          Thebutton(ontap: ( ) { }, icon: Icons.share, text: 'refer to friends'),
          Divider() ,
          Thebutton(ontap: () { }, icon: Icons.help , text: 'Help') ,
          Divider() ,
          Thebutton(ontap: () {
            servicesSetting.sharedPreferences.clear() ;
            Get.offAll( () => Login() ) ;
          }, icon: Icons.logout, text: 'Log out') , 
        ],
      ),  
    );
  }
}
