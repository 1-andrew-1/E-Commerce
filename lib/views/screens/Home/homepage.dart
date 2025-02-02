import 'package:flutter/material.dart';
import 'package:furitshop/views/screens/Home/bottonnavigarion.dart';
import 'package:furitshop/controller/homecontroller.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final Homecontroller controller = Get.put(Homecontroller()) ;
  // ignore: non_constant_identifier_names
  void IntialHomepage ( ) async {
    await controller.getproduct() ;
  }
  @override
  void initState() {
    super.initState();
    IntialHomepage();
  }
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3));
    return Scaffold(
       bottomNavigationBar: Obx( () =>
         controller.isfetched.value ? const BottomNavigation () : Center(
         child: Text('Loading...'),
       )),
    );
  }
}
