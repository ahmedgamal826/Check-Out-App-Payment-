import 'package:dio/dio.dart';
import 'package:flutter_payment/core/utils/api_keys.dart';
import 'package:flutter_payment/core/utils/api_services.dart';
import 'package:flutter_payment/features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:flutter_payment/features/checkout/data/models/init_payment_sheet_input_model.dart';
import 'package:flutter_payment/features/checkout/data/models/payment_init_input_model.dart';
import 'package:flutter_payment/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeServices {
  final ApiServices apiServices = ApiServices();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    try {
      var response = await apiServices.post(
        body: paymentIntentInputModel.tojson(),
        url: 'https://api.stripe.com/v1/payment_intents',
        token: ApiKeys.secretApiKey,
        contentType: Headers.formUrlEncodedContentType,
      );

      var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
      return paymentIntentModel;
    } catch (e) {
      throw Exception('Error creating payment intent: $e');
    }
  }

  // init payment sheet

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
            paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
            customerEphemeralKeySecret:
                initPaymentSheetInputModel.empheralKeySecret,
            customerId: initPaymentSheetInputModel.customerId,
            merchantDisplayName: 'Ahmed Elnemr'),
      );
    } catch (e) {
      throw Exception('Error initializing payment sheet: $e');
    }
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  // Method to make payment steps
  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      var paymentIntentModel =
          await createPaymentIntent(paymentIntentInputModel);

      var emphemeralSecretKeyModel = await createEmphemeralKey(
          customerId: paymentIntentInputModel.customerId);

      var initPaymentSheetInputModel = InitPaymentSheetInputModel(
        customerId: paymentIntentInputModel.customerId,
        clientSecret: paymentIntentModel.clientSecret!,
        empheralKeySecret: emphemeralSecretKeyModel.secret!,
      );

      await initPaymentSheet(
          initPaymentSheetInputModel: initPaymentSheetInputModel);

      await displayPaymentSheet();
    } catch (e) {
      throw Exception('Payment failed: $e');
    }
  }

  Future<EphemeralKeyModel> createEmphemeralKey(
      {required String customerId}) async {
    try {
      var response = await apiServices.post(
        body: {'customer': customerId},
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        token: ApiKeys.secretApiKey,
        contentType: Headers.formUrlEncodedContentType,
        headers: {
          'Authorization': "Bearer ${ApiKeys.secretApiKey}",
          'Stripe-Version': '2023-10-16',
        },
      );

      var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);
      return ephemeralKeyModel;
    } catch (e) {
      print(e);
      throw Exception('Error creating Emphemeral Key: $e');
    }
  }
}
