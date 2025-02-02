import 'package:flutter/material.dart';
import 'package:furitshop/views/screens/cardwidget/widget/addtofavourite.dart';
import 'package:furitshop/views/screens/cardwidget/widget/cardw.dart';
import 'package:furitshop/views/screens/cardwidget/widget/photo.dart';
import 'package:furitshop/views/screens/cardwidget/widget/price.dart';
import 'package:furitshop/views/screens/cardwidget/widget/rating.dart';
import 'package:furitshop/views/screens/cardwidget/widget/title.dart';
import 'package:furitshop/views/screens/detials/detail.dart';
import 'package:furitshop/core/defaultsize/sizeconig.dart';
import 'package:get/get.dart';

class Cardwidgt extends StatefulWidget {
  const Cardwidgt({
    super.key,
    required this.photo,
    required this.title,
    required this.price,
    required this.rating,
    required this.id,
    required this.index,
  });
  final String photo;
  final String title;
  final String price;
  final double rating;
  final int id;
  final int index;

  @override
  State<Cardwidgt> createState() => _CardwidgtState();
}

class _CardwidgtState extends State<Cardwidgt> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => Detail(ID: widget.index));
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
            height: Sizeconig.defaultsize! * 22,
            width: Sizeconig.defaultsize! * 15,
            child: CardW(
              child: Stack(
              children: [
                Positioned(
                  top: Sizeconig.defaultsize! * 1.8,
                  left: Sizeconig.defaultsize! * 2.5,
                  child: Photo(phot: widget.photo)),

                Positioned(
                  top: Sizeconig.defaultsize! * 1.8,
                  right: Sizeconig.defaultsize! * 1.2,
                  child: Addtofavorite(id: widget.id)),

                  Positioned(
                    top: Sizeconig.defaultsize! * 14,
                    left: Sizeconig.defaultsize! * 3.5,
                    child: RatingWidget(
                      rating: widget.rating,)),

                    Positioned(
                    top: Sizeconig.defaultsize! * 16.6,
                     left: Sizeconig.defaultsize! * 1,
                     right: Sizeconig.defaultsize! * 1,
                    child: TitleW(
                      title: widget.title,)),
                      
                    Positioned(
                    top: Sizeconig.defaultsize! * 18.9,
                    left: Sizeconig.defaultsize! * 1,
                    right: Sizeconig.defaultsize! * 1,
                    child: Price(
                      price: widget.price,)),
              ],
            ))),
      ),
    );
  }
}




