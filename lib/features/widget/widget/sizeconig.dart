import 'package:flutter/material.dart';

class Sizeconig {
  static double? screenwidth;
  static double? screenheight;
  static double? defaultsize;
  static Orientation? orientation;
  void init(BuildContext context) {
    screenwidth = MediaQuery.of(context).size.width;
    screenheight = MediaQuery.of(context).size.height;
    defaultsize = orientation == Orientation.landscape
        ? screenheight! * .024
        : screenwidth! * .024;
  }
}
