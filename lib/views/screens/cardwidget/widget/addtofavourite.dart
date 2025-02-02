import 'package:flutter/material.dart';
import 'package:furitshop/controller/homecontroller.dart';
import 'package:furitshop/core/defaultsize/sizeconig.dart';
import 'package:get/get.dart';

class Addtofavorite extends StatelessWidget {
  const Addtofavorite({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    final Homecontroller c = Get.put(Homecontroller());
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: InkWell(
        onTap: () {
          if (!c.check(id)) {
            c.addToFavorite(id);
          } else {
            c.addToFavorite(id);
          }
        },
        child: Obx(
          () => Icon(
            Icons.favorite,
            color: c.check(id) ? Colors.red : Colors.black,
            size: Sizeconig.defaultsize! * 2.2,
          ),
        ),
      ),
    );
  }
}
