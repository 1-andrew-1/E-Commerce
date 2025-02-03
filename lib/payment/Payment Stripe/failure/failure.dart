import 'package:dartz/dartz.dart';
import 'package:furitshop/payment/Payment%20Stripe/Models/payment_intent_input_model.dart';
abstract class Checkoutrepo {
  Future <Either<Failure , void >> initializePayment( {
    required PaymentIntentInputModel paymentIntentInputModel
  }) ; 
}


abstract class Failure {
    final String error ;
    Failure({required this.error});
}
class FailureServer extends Failure {
  FailureServer({required super.error});
}