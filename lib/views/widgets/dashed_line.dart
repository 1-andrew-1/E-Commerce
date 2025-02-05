import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  const DashedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: .22 * MediaQuery.sizeOf(context).height,
        left: 25,
        child: Row(
          children: List.generate(19, (int index) {
            return Container(
              margin: EdgeInsets.all(2),
              height: 2,
              width: 12.5,
              color: Colors.green,
            );
          }),
        ));
  }
}
