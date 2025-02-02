import 'package:flutter/material.dart';
import 'package:furitshop/views/themes/appstyle.dart';

class Addtocartbutton extends StatelessWidget {
  const Addtocartbutton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.iconData,
  });

  final VoidCallback onPressed;
  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 10), // Added some margin
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 1),
        borderRadius: BorderRadius.circular(20), // Softer border radius
        color: Colors.white, // Clean white background
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(0, 5),
            blurRadius: 10,
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20), // Matching container radius
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                text,
                style: Appstyle().addtocartStyle.copyWith(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(right: 20), // Slight spacing
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green.withOpacity(0.1), // Subtle background
              ),
              child: Icon(
                iconData,
                color: Colors.green,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
