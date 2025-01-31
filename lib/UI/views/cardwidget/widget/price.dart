import 'package:flutter/material.dart';
import 'package:furitshop/features/widget/widget/sizeconig.dart';

class Price extends StatelessWidget {
  const Price({super.key, required this.price});
  final String price;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '¶ $price',
        style: TextStyle(
          fontSize: Sizeconig.defaultsize! * 1.6,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}
