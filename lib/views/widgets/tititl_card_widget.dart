import 'package:flutter/material.dart';
import 'package:furitshop/core/defaultsize/sizeconig.dart';
class Thelistviewofhomepage extends StatelessWidget {
  const Thelistviewofhomepage({super.key, required this.title, required this.description, required this.descount});
  final String title;
  final String description;
  final String descount;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: Sizeconig.defaultsize! * 1.2,
              left: Sizeconig.defaultsize! * 1.2),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Sizeconig.defaultsize! * 2,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: Sizeconig.defaultsize! * 1.2,
                ),
                child: Text('($descount% Off)',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: Sizeconig.defaultsize! * 1.4)),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: Sizeconig.defaultsize! * .5,
              left: Sizeconig.defaultsize! * 1.2),
          child: Text(
            description,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: Sizeconig.defaultsize! * 1.2,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

