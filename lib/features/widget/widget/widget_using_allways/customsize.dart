import 'package:flutter/material.dart';
import 'package:furitshop/features/widget/widget/sizeconig.dart';

class Heightspace extends StatelessWidget {
  final double ? value ;

  const Heightspace({super.key,  required this.value});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Sizeconig.defaultsize! * value! ,
    );
  }
}
class Wighetspace extends StatelessWidget {
  final double ? value ;
  const Wighetspace({super.key,  required this.value});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Sizeconig.defaultsize! * value! ,
    );
  }
}