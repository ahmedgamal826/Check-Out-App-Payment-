import 'package:dartz/dartz.dart';
import 'package:flutter_payment/core/errors/failures.dart';
import 'package:flutter_payment/core/utils/stripe_services.dart';
import 'package:flutter_payment/features/checkout/data/models/payment_init_input_model.dart';
import 'package:flutter_payment/features/checkout/data/repos/checkout_repo.dart';

class CheckoutRepoImplementation extends CheckoutRepo {
  StripeServices stripeServices = StripeServices();

  @override
  Future<Either<Failures, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await stripeServices.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);

      return right(null); // dont return any thing
    } on Exception catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
