import 'package:flutter/material.dart';
import 'package:furitshop/controller/controller.dart';
import 'package:furitshop/views/screens/Home/the%20pages%20of%20homepages/womenclothes.dart';
import 'package:furitshop/views/screens/Home/the%20pages%20of%20homepages/menclothing.dart';
import 'package:furitshop/views/screens/Home/the%20pages%20of%20homepages/menpage.dart';
import 'package:furitshop/views/widgets/row_button.dart';
import 'package:furitshop/core/defaultsize/sizeconig.dart';
import 'package:furitshop/views/widgets/appbar_search_homepage.dart';
import 'package:get/get.dart';


class Homepagebody extends StatefulWidget {
  const Homepagebody({super.key});

  @override
  State<Homepagebody> createState() => _HomepagebodyState();
}

class _HomepagebodyState extends State<Homepagebody> {
  // Initialize a PageController
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Countcontroller c = Get.put(Countcontroller()) ;
    return Scaffold(
      body: 
         SingleChildScrollView(
           child: Column(
              children: [
                 Appbarhomepage(),
                 Padding(
                    padding:  EdgeInsets.only(
                      left: Sizeconig.defaultsize! * 4.5 ,
                      right: Sizeconig.defaultsize! * 4.5 ,
                      top: Sizeconig.defaultsize! * 2.6 ,
                    ),
                    child: RowButtonController(),
                  ),
                
                SizedBox(height: Sizeconig.defaultsize! * .5),
                 SizedBox(
                  height: Sizeconig.defaultsize! * 55  ,
                  width: double.infinity,
                   child: PageView(
                    allowImplicitScrolling: true,
                      controller: c.pageController ,
                      onPageChanged: (value) => c.setcount(value.obs),
                      children: [
                        Menpage(),
                        Menclothing(),
                        WomanColothes(),
                      ],
                    ),
                 ),
              ],
            ),
         ),
    );
  }
}
