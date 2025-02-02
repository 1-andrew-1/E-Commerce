import 'package:flutter/widgets.dart';
import 'package:furitshop/controller/controller.dart';
import 'package:furitshop/views/widgets/custom_button.dart';
import 'package:get/get.dart';

class RowButtonController extends StatelessWidget {
  const RowButtonController({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GetX<Countcontroller>(builder: (c) =>Textbuttonwidget(name: 'All', onPressed: () {
                   c.setcount(0.obs) ;
                   c.setPage(0.obs) ;
                },isSelected: c.count.value == 0 ,), ) ,
                GetX<Countcontroller>(builder: (c) =>Textbuttonwidget(name: 'MEN CLOTHES', onPressed: () {
                   c.setcount(1.obs) ;
                   c.setPage(1.obs) ;
                },isSelected: c.count.value == 1 ,), ) ,
                GetX<Countcontroller>(builder: (c) =>Textbuttonwidget(name: 'Electronics', onPressed: () {
                   c.setcount(2.obs) ;
                   c.setPage(2.obs) ;
                },isSelected: c.count.value == 2 ,), ) ,
              ],
            );
  }
}