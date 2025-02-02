import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key, required this.rating});
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RatingBar.builder(
        initialRating: rating,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: Colors.orange,
          size: 10,
        ),
        onRatingUpdate: (rating) {
          print(rating);
        },
        itemSize: 15.0,
        unratedColor: Colors.grey[300],
        glow: false,
        glowColor: Colors.amber.withOpacity(0.5),
        ignoreGestures: false,
      ),
    );
  }
}