import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:furitshop/payment/Payment%20Stripe/Models/payment_intent_input_model.dart';
import 'package:furitshop/payment/Payment%20Stripe/implement/chekoutrepoimplement.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.implement) : super(PaymentInitial());
  final CheckStripeServiceImplement implement ;
  Future makepayment ( {
    required PaymentIntentInputModel paymentIntentInputModel}) async {
      try {
        emit(PaymentLoading()) ;
        var data = await implement.initializePayment(
        paymentIntentInputModel: paymentIntentInputModel);
        data.fold((l) => emit(PaymentError(l.error)) , (r) => emit(PaymentSuccess())) ;
      }catch (e) {
        print(e) ;
      }
  }
  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString()) ;
    super.onChange(change);
  }
}
