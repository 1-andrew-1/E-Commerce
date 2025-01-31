import 'package:flutter/material.dart';
import 'package:furitshop/UI/views/Favourite/myfavourite.dart';
import 'package:furitshop/UI/views/cart/mycaed.dart';
import 'package:furitshop/core/services/services_setting.dart';
import 'package:furitshop/features/auth/view/login.dart';
import 'package:furitshop/features/widget/widget/widget_using_allways/customsize.dart';
import 'package:furitshop/UI/views/account/stackmyaccount.dart';
import 'package:furitshop/UI/views/account/thebutton.dart';
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
