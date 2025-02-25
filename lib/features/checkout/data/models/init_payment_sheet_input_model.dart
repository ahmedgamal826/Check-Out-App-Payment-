class InitPaymentSheetInputModel {
  final String customerId;
  final String clientSecret;
  final String empheralKeySecret;

  InitPaymentSheetInputModel(
      {required this.customerId,
      required this.clientSecret,
      required this.empheralKeySecret});
}
