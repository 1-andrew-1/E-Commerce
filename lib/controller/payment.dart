import 'package:furitshop/controller/firebase_asynic.dart';
import 'package:furitshop/payment/Payment%20Stripe/Models/payment_intent_input_model.dart';
import 'package:furitshop/payment/Payment%20Stripe/Stripe%20Service/stripe_service.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  RxBool paymentLoading = false.obs ;
  RxBool paymentSuccess = false.obs ;
  RxBool paymentError = false.obs ;
  final StripeService stripeService = StripeService();
  final FirebaseAsync firebaseAsync = Get.put(FirebaseAsync());
  Future makepayment ( {
    required PaymentIntentInputModel paymentIntentInputModel}) async {
      try {
        paymentLoading.value = true;
        await stripeService.initializePaymentIntent(paymentIntentInputModel:paymentIntentInputModel);
        paymentLoading.value = false;
    }catch (e) {
      paymentError.value = true;
      // print('Failed to initialize $e');
    }
  }
  List <dynamic> L = [];
  void clear () {
    firebaseAsync.updateUserCart(cart: L );
    paymentLoading.value = false;
    paymentSuccess.value = false;
    paymentError.value = false;
  }
}