class PaymentIntentInputModel {
  final String ammount;
  final String currencyCode;
  PaymentIntentInputModel({required this.ammount, required this.currencyCode});
  tojson() {
    return ({
      'amount': ammount,
      'currency': currencyCode,
    });
  }
}
