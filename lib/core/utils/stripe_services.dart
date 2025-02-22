import 'package:flutter_payment/core/utils/api_keys.dart';
import 'package:flutter_payment/core/utils/api_services.dart';
import 'package:flutter_payment/features/checkout/data/models/payment_init_input_model.dart';
import 'package:flutter_payment/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';

class StripeServices {
  final ApiServices apiServices = ApiServices();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentInitInputModel paymentInitInputModel) async {
    var response = await apiServices.post(
      body: paymentInitInputModel.tojson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretApiKey,
    );

    var paymentIntentModel = response.data;

    return paymentIntentModel;
  }
}
