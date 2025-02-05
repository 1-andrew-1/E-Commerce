import 'package:flutter/material.dart';

class CheckCircleAvatar extends StatelessWidget {
  const CheckCircleAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -43,
      left: 0,
      right: 0,
      child: CircleAvatar(
        radius: 43,
        backgroundColor: Colors.blue[100],
        child: CircleAvatar(
          radius: 37,
          backgroundColor: Colors.green[700],
          child: Icon(
            Icons.check,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
