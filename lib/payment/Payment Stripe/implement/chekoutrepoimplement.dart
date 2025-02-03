import 'package:dartz/dartz.dart';
import 'package:furitshop/payment/Payment%20Stripe/Models/payment_intent_input_model.dart';
import 'package:furitshop/payment/Payment%20Stripe/Stripe%20Service/stripe_service.dart';
import 'package:furitshop/payment/Payment%20Stripe/failure/failure.dart';
class CheckStripeServiceImplement extends Checkoutrepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> 
  initializePayment({required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.initializePaymentIntent(paymentIntentInputModel:paymentIntentInputModel);
      return const Right(null);
    }catch (e) {
      return Left(FailureServer(error: e.toString()));
    }
  }
}