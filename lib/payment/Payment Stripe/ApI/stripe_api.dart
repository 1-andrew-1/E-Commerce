import 'package:dio/dio.dart';
import 'package:furitshop/payment/Payment%20Stripe/Stripe%20Keys/stripe_keys.dart';
class StripeApi {
  final Dio dio = Dio();
  postrequest({
    required String token,
    required body,
  }) async {
    var response = await dio.post(
      StripeKeys.url,
      data: body,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
    );
    return response ;
  }
}