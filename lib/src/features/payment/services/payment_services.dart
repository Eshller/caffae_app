// // ignore_for_file: depend_on_referenced_packages

// import 'dart:convert';

// import 'package:amplify_flutter/amplify_flutter.dart';
// import 'package:caffae_app/src/Global/Export/export.dart';
// import 'package:flutter_cashfree_pg_sdk/api/cfpayment/cfdropcheckoutpayment.dart';
// import 'package:flutter_cashfree_pg_sdk/api/cfpaymentcomponents/cfpaymentcomponent.dart';
// import 'package:flutter_cashfree_pg_sdk/api/cfpaymentgateway/cfpaymentgatewayservice.dart';
// import 'package:flutter_cashfree_pg_sdk/api/cfsession/cfsession.dart';
// import 'package:flutter_cashfree_pg_sdk/api/cftheme/cftheme.dart';
// import 'package:flutter_cashfree_pg_sdk/utils/cfenums.dart';
// import 'package:flutter_cashfree_pg_sdk/utils/cfexceptions.dart';
// import 'package:http/http.dart' as http;

// final pyamentRepositoryProvider = Provider((ref) => PaymentRepository());

// class PaymentRepository {
//   PaymentRepository();

//   CFPaymentGatewayService cfPaymentGatewayService = CFPaymentGatewayService();
//   createSessionID({
//     required String orderID,
//     required String orderAmount,
//     required String customerId,
//     required String customerName,
//     required String customerEmail,
//     required String customerPhoneNumber,
//   }) async {
//     var headers = {
//       'Content-Type': 'application/json',
//       'x-client-id': "",
//       'x-client-secret': "",
//       'x-api-version': '2022-09-01',
//       'x-request-id': 'fluterwings'
//     };
//     safePrint(headers);
//     var request = http.Request(
//         'POST', Uri.parse('https://sandbox.cashfree.com/pg/orders'));
//     request.body = json.encode({
//       "order_amount": orderAmount,
//       "order_id": orderID,
//       "order_currency": "INR",
//       "customer_details": {
//         "customer_id": customerId,
//         "customer_name": customerName,
//         "customer_email": customerEmail,
//         "customer_phone": customerPhoneNumber,
//       },
//       "order_meta": {"notify_url": "https://test.cashfree.com"},
//       "order_note": "some order note here"
//     });
//     request.headers.addAll(headers);

//     http.StreamedResponse response = await request.send();

//     if (response.statusCode == 200) {
//       return jsonDecode(await response.stream.bytesToString());
//     } else {
//       safePrint(await response.stream.bytesToString());
//       safePrint(response.reasonPhrase);
//     }
//     return null;
//   }

//   Future<CFSession?> createSession({
//     required String orderId,
//     required String orderAmount,
//     required String customerId,
//     required String customerName,
//     required String customerEmail,
//     required String customerPhoneNumber,
//   }) async {
//     try {
//       final mySessionIDData = createSessionID(
//         orderID: orderId,
//         customerId: customerId,
//         orderAmount: orderAmount,
//         customerPhoneNumber: customerPhoneNumber,
//         customerEmail: customerEmail,
//         customerName: customerName,
//       ); // This will create session id from flutter itself

//       // Now we will se some parameter like orderID ,environment,payment sessionID
//       // after that we wil create the checkout session
//       // which will launch through which user can pay.
//       var session = CFSessionBuilder()
//           .setEnvironment(CFEnvironment.SANDBOX)
//           .setOrderId(mySessionIDData["order_id"])
//           .setPaymentSessionId(mySessionIDData["payment_session_id"])
//           .build();
//       return session;
//     } on CFException catch (e) {
//       safePrint(e.message);
//     }
//     return null;
//   }

//   pay({
//     required String orderID,
//     required String orderAmount,
//     required String customerId,
//     required String customerName,
//     required String customerEmail,
//     required String customerPhoneNumber,
//   }) async {
//     try {
//       var session = await createSession(
//         orderId: orderID,
//         customerId: customerId,
//         orderAmount: orderAmount,
//         customerPhoneNumber: customerPhoneNumber,
//         customerEmail: customerEmail,
//         customerName: customerName,
//       );
//       List<CFPaymentModes> components = <CFPaymentModes>[];
//       // If you want to set paument mode to be shown to customer
//       var paymentComponent =
//           CFPaymentComponentBuilder().setComponents(components).build();
//       // We will set theme of checkout session page like fonts, color
//       var theme = CFThemeBuilder()
//           .setNavigationBarBackgroundColorColor("#FF0000")
//           .setPrimaryFont("Menlo")
//           .setSecondaryFont("Futura")
//           .build();
//       // Create checkout with all the settings we have set earlier
//       var cfDropCheckoutPayment = CFDropCheckoutPaymentBuilder()
//           .setSession(session!)
//           .setPaymentComponent(paymentComponent)
//           .setTheme(theme)
//           .build();
//       // Launching the payment page

//       cfPaymentGatewayService.doPayment(cfDropCheckoutPayment);
//     } on CFException catch (e) {
//       safePrint(e.message);
//     }
//   }
// }
