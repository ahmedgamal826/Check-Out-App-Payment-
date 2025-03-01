import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_payment/core/utils/api_keys.dart';
import 'package:flutter_payment/core/widgets/custom_button.dart';
import 'package:flutter_payment/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:flutter_payment/features/checkout/data/models/amount_model/details.dart';
import 'package:flutter_payment/features/checkout/data/models/items_list_model/item.dart';
import 'package:flutter_payment/features/checkout/data/models/items_list_model/items_list_model.dart';
import 'package:flutter_payment/features/checkout/data/models/payment_init_input_model.dart';
import 'package:flutter_payment/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:flutter_payment/features/checkout/presentation/views/thank_you_view.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class CustomButtonConsumer extends StatelessWidget {
  const CustomButtonConsumer({
    required this.selectedPaymentMethod,
    super.key,
  });

  final String selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        // success
        if (state is PaymentSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ThankYouView(),
            ),
          );
        }
        // failure
        if (state is PaymentFailure) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.errorMessage.toString(),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is PaymentLoading ? true : false,
          title: 'Continue',
          onTap: () {
            if (selectedPaymentMethod == "Credit") {
              _processCreditPayment(context);
            } else if (selectedPaymentMethod == "PayPal") {
              _processPaypalPayment(context);
            }
          },
        );
      },
    );
  }

  void _processCreditPayment(BuildContext context) {
    PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
      amount: '100',
      currency: 'USD',
      customerId: 'cus_Rq8j7c8TiLYAVq',
    );

    BlocProvider.of<PaymentCubit>(context).makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );
  }

  void _processPaypalPayment(BuildContext context) {
    var transactionsData = getTrasnactionsData();
    executePaypalPayment(context, transactionsData);
  }

  void executePaypalPayment(BuildContext context,
      ({AmountModel amount, ItemsListModel itemListModel}) transactionsData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.cliendId,
        secretKey: ApiKeys.paypalSecretKey,
        transactions: [
          {
            "amount": transactionsData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactionsData.itemListModel.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ThankYouView(),
            ),
          );
        },
        // onError: (error) {
        //   log("onError: $error");
        //   Navigator.pop(context);
        // },

        onError: (error) {
          log("onError: $error");
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Error"),
              content: Text("An error occurred during payment: $error"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"),
                ),
              ],
            ),
          );
        },

        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }

  ({AmountModel amount, ItemsListModel itemListModel}) getTrasnactionsData() {
    List<OrderItemModel> orders = [
      OrderItemModel(
        currency: 'USD',
        name: 'Apple',
        price: '4',
        quantity: 10,
      ),
      OrderItemModel(
        currency: 'USD',
        name: 'Apple',
        price: '5',
        quantity: 12,
      )
    ];

    var itemListModel = ItemsListModel(orders: orders);

    var amount = AmountModel(
      total: "100",
      currency: "USD",
      details: Details(
        shipping: '0',
        shippingDiscount: 0,
        subtotal: '100',
      ),
    );

    return (amount: amount, itemListModel: itemListModel);
  }
}
