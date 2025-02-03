import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furitshop/payment/Payment%20Stripe/Cubit/payment_cubit.dart';
import 'package:furitshop/payment/Payment%20Stripe/Models/payment_intent_input_model.dart';
import 'package:furitshop/payment/Payment%20Stripe/homepage.dart';


class Payment extends StatelessWidget {
  const Payment({super.key, required this.total});
  final double total;
  @override
  Widget build(BuildContext context) {
    bool islodding = false;
    return BlocConsumer<PaymentCubit, PaymentState>(
          listener: (context, state) {
             if (state is PaymentLoading) {
              islodding = true;
             }
              if (state is PaymentSuccess) {
                islodding = false ;
                print('Payment Successful');
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Homepage()),
                );
              } else if (state is PaymentError) {
                islodding = false ;
                print('Payment Failed');
              }
  
          },
          builder: (context, state) {
            return 
               islodding ? const CircularProgressIndicator() : FloatingActionButton(
                onPressed: () async {
                  await BlocProvider.of<PaymentCubit>(context).makepayment(
                    paymentIntentInputModel: PaymentIntentInputModel
                    (ammount: total.toString(), currencyCode: "USD"));
                  print('Floating action button clicked!');
                },
                tooltip: 'Click me',
                child: Icon(Icons.add),
              );
          },
        );
  }
}