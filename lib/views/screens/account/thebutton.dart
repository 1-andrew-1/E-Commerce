import 'package:flutter/material.dart';
import 'package:furitshop/core/defaultsize/sizeconig.dart';

class Thebutton extends StatelessWidget {
  const Thebutton({super.key, required this.ontap, required this.icon, required this.text});
  final VoidCallback ontap ;
  final IconData icon ;
  final String text ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: ListTile(
      leading: Icon(
        icon,
        color: Colors.green,
        size: Sizeconig.defaultsize!* 3.3,
      ),
      title: Text(text,textScaleFactor: Sizeconig.defaultsize! * .13  ,),
    ),
    );
  }
  
}