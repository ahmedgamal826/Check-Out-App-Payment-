import 'package:dartz/dartz.dart';
import 'package:flutter_payment/core/errors/failures.dart';
import 'package:flutter_payment/features/checkout/data/models/payment_init_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failures, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  });
}
