// import 'package:flutter/material.dart';
// import 'package:flutter_payment/features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
// import 'stripe_services.dart';

// class PaymentScreen extends StatefulWidget {
//   @override
//   _PaymentScreenState createState() => _PaymentScreenState();
// }

// class _PaymentScreenState extends State<PaymentScreen> {
//   final StripeServices stripeServices = StripeServices();
//   bool isLoading = false;

//   // دالة تنشئ مفتاح Ephemeral Key عند الضغط على الزر
//   Future<void> handleCreateEphemeralKey() async {
//     setState(() {
//       isLoading = true;
//     });

//     try {
//       String customerId = "cus_Rq8j7c8TiLYAVq"; // ضع الـ Customer ID الصحيح هنا
//       EphemeralKeyModel ephemeralKey = await stripeServices.createEmphemeralKey(
//         customerId: customerId,
//       );

//       print("Ephemeral Key Created: ${ephemeralKey.secret}");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Ephemeral Key Created Successfully")),
//       );
//     } catch (e) {
//       print("Error: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Failed to Create Ephemeral Key")),
//       );
//     }

//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Stripe Payment")),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: isLoading ? null : handleCreateEphemeralKey,
//           child: isLoading
//               ? CircularProgressIndicator()
//               : Text("Create Ephemeral Key"),
//         ),
//       ),
//     );
//   }
// }
