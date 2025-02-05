import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furitshop/views/widgets/card_info_widget.dart';
import 'package:furitshop/views/widgets/payment_info_item.dart';
import 'package:furitshop/views/widgets/styles.dart';
import 'package:furitshop/views/widgets/total_price_widget.dart';
import 'package:intl/intl.dart';

class ContentColumn extends StatelessWidget {
  const ContentColumn({
    super.key,
  });
  // Format the date and time

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('d/M/yyyy').format(DateTime.now());
    String formattedTime = DateFormat('hh:mm a').format(DateTime.now());
    return Column(
      children: [
        Text(
          'Thank you!',
          textAlign: TextAlign.center,
          style: Styles.style25,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Your transaction was successful',
          textAlign: TextAlign.center,
          style: Styles.style18,
        ),
        const SizedBox(
          height: 42,
        ),
        PaymentItemInfo(
          title: 'Date',
          value: formattedDate,
        ),
        const SizedBox(
          height: 20,
        ),
        PaymentItemInfo(
          title: 'Time',
          value: formattedTime,
        ),
        const SizedBox(
          height: 20,
        ),
        const PaymentItemInfo(
          title: 'To',
          value: 'Sam Louis',
        ),
        Divider(
          height: 60,
          thickness: 2,
          color: Colors.green[200],
        ),
        const TotalPrice(title: 'Total', value: r'$450'),
        const SizedBox(
          height: 30,
        ),
        const CardInfoWidget(),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              FontAwesomeIcons.barcode,
              size: 64,
            ),
            Container(
              width: 113,
              height: 58,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1.50,
                    color: Colors.green,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Center(
                child: Text(
                  'PAID',
                  textAlign: TextAlign.center,
                  style: Styles.style24.copyWith(
                    color: const Color(0xff1e64bc),
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: ((MediaQuery.sizeOf(context).height * .2 + 20) / 2) - 29,
        ),
      ],
    );
  }
}