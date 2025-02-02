import 'package:flutter/material.dart';
import 'package:furitshop/core/defaultsize/sizeconig.dart';

class Appstyle {
  TextStyle titledetailStyle = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: Sizeconig.defaultsize! * 2,
  );
  TextStyle descriptStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: Sizeconig.defaultsize! * 1.8,
  );
  TextStyle priceStyle = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: Sizeconig.defaultsize! * 1.9,
  );
  TextStyle countStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: Sizeconig.defaultsize! * 1.9,
  );
  TextStyle addtocartStyle = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: Sizeconig.defaultsize! * 2.1,
  );
}
