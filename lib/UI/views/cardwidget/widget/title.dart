import 'package:flutter/material.dart';
import 'package:furitshop/features/widget/widget/sizeconig.dart';

class TitleW extends StatelessWidget {
  const TitleW({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Center(
        child: Text(
          overflow: TextOverflow.ellipsis,
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Sizeconig.defaultsize! * 1.6,
          ),
        ),
      ),
    );
  }
}