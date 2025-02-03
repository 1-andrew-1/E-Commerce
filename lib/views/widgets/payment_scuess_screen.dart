import 'package:flutter/material.dart';

class PaymentScuessScreen extends StatelessWidget {
  const PaymentScuessScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Center(
          child: Column(
        key: ValueKey(2),
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 250),
          Icon(Icons.check_circle, size: 100, color: Colors.green),
          SizedBox(height: 15),
          Text("Payment Successful",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text("Your Order is Booked.", style: TextStyle(fontSize: 16)),
        ],
      )),
    );
  }
}
