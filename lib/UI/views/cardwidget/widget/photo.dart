import 'package:flutter/material.dart';
import 'package:furitshop/features/widget/widget/sizeconig.dart';

class Photo extends StatelessWidget {
  const Photo({super.key, required this.phot});
  final String phot;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: Image.network(
        phot,
        width: Sizeconig.defaultsize! * 10,
        height: Sizeconig.defaultsize! * 10,
        fit: BoxFit.contain,
      ),
    );
  }
}