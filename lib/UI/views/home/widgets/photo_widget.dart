import 'package:flutter/material.dart';
import 'package:furitshop/features/widget/widget/sizeconig.dart';

class PhotoWidget extends StatelessWidget {
  const PhotoWidget({super.key, required this.photo});
  final String photo;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        alignment: Alignment.center,
        height: Sizeconig.defaultsize! * 25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              photo,
              fit: BoxFit.contain,
            )));
  }
}
