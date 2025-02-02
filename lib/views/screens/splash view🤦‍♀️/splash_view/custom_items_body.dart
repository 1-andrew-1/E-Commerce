import 'package:flutter/material.dart';
import 'package:furitshop/core/defaultsize/sizeconig.dart';
import 'package:furitshop/views/widgets/spacher.dart';

class Customitemsbody extends StatelessWidget  {
  const Customitemsbody({super.key, this.text1, this.text2, this.images});
  final String ? text1 ;
  final String ? text2 ;
  final String ? images ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          const Heightspace(value: 10,) ,
          SizedBox( height: Sizeconig.defaultsize! * 45 , child: Image.asset(images!)),
          Text(text1! , style: TextStyle(
            fontSize: Sizeconig.defaultsize! * 2.8,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),) ,
          const Heightspace(value: 2) ,
          Text(text2! , style: TextStyle(
            fontSize: Sizeconig.defaultsize! * 1.8,
            fontFamily: 'Poppins',
            color: const Color(0xff898989),
          ) ) ,
      ],
    );
  }

}