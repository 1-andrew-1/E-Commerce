import 'package:flutter/material.dart';

class CardW extends StatelessWidget {
  const CardW({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      shadowColor: Colors.black,
      child: child,
    );
  }
}