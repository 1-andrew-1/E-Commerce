import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:furitshop/controller/payment.dart';
import 'package:furitshop/payment/Payment%20Stripe/ApI/stripe_api.dart';
import 'package:furitshop/payment/Payment%20Stripe/Models/payment_intent_input_model.dart';
import 'package:furitshop/payment/Payment%20Stripe/Models/payment_model.dart';
import 'package:furitshop/payment/Payment%20Stripe/Stripe%20Keys/stripe_keys.dart';
import 'package:get/get.dart';

class StripeService {
  StripeApi apiStripeServices = StripeApi();
  // create payment intent object
  Future<PaymentModel> createPaymentIntent(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      var response = await apiStripeServices.postrequest(
        body: paymentIntentInputModel.tojson(), 
        token: StripeKeys.secretKey);
        var paymentIntent = PaymentModel.fromJson(response.data);
        return paymentIntent;
    }catch (e) {
      print(e) ;
      rethrow;
    }
  }
  
  // crate payment intent sheet
  Future<void> initPaymentSheet(
      {required String paymentIntentClientSecret}) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Set to true for custom flow
          customFlow: false,
          // Main params
          merchantDisplayName: 'Flutter Stripe Store Demo',
          paymentIntentClientSecret: paymentIntentClientSecret,
        ),
      );
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  // display the paymentIntent
 Future<void> displayPaymentIntent() async {
  try {
    final PaymentController paymentController = Get.put(PaymentController()) ;
    // Present the payment sheet
    await Stripe.instance.presentPaymentSheet();
    // Listen for the payment sheet's completion event
    paymentController.paymentSuccess = true.obs ;
    print("Payment flow completed successfully!");
  } catch (e) {
    print("===============================$e") ;
    }
}


  // intialize the paymentIntent
  Future<void> initializePaymentIntent(
    {required PaymentIntentInputModel paymentIntentInputModel}  // amount and currency are required
  ) async {
    var paymentIntent = await createPaymentIntent(paymentIntentInputModel: 
    paymentIntentInputModel) ;
    await initPaymentSheet(paymentIntentClientSecret: paymentIntent.clientSecret!);
    await displayPaymentIntent();
  }
}
