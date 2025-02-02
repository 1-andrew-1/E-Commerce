import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:furitshop/core/defaultsize/sizeconig.dart';
import 'package:furitshop/core/services/services_setting.dart';
import 'package:furitshop/views/screens/Home/homepage.dart';
import 'package:furitshop/views/screens/splash%20view%F0%9F%A4%A6%E2%80%8D%E2%99%80%EF%B8%8F/padgeview/padge_view.dart';
import 'package:furitshop/views/screens/splash%20view%F0%9F%A4%A6%E2%80%8D%E2%99%80%EF%B8%8F/splash_view/splashview.dart';
import 'package:get/get.dart';
// Splashviewbody don`t forget to make it false 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initservice() ;
  await Firebase.initializeApp();
  runApp(const MyApp());
}

Future initservice () async {
   await Get.putAsync( () => ServicesSetting().init() ) ;
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
      Sizeconig().init(context);
      return GetMaterialApp(
          home: const Splashview() ,
          getPages: [
            GetPage(name: '/home', page: () => const Homepage()),
            GetPage(name: '/padeview', page: () => const NextPage() ),
            // Add your other pages here
          ],
      );
  }
  
}
