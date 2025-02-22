class PaymentInitInputModel {
  final String amount;
  final String currency;

  PaymentInitInputModel({
    required this.amount,
    required this.currency,
  });

  tojson() {
    return {
      'amount': amount,
      'currency': currency,
    };
  }
}
