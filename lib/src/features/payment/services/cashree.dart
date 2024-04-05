// import 'package:amplify_flutter/amplify_flutter.dart';
// import 'package:caffae_app/src/Global/Export/export.dart';
// import 'package:caffae_app/src/features/payment/services/payment_services.dart';
// import 'package:flutter_cashfree_pg_sdk/api/cferrorresponse/cferrorresponse.dart';

// class CashFreePayment extends ConsumerStatefulWidget {
//   const CashFreePayment({super.key});

//   @override
//   ConsumerState<CashFreePayment> createState() => _CashFreePaymentState();
// }

// class _CashFreePaymentState extends ConsumerState<CashFreePayment> {
//   // CFPaymentGatewayService cfPaymentGatewayService =
//   //     CFPaymentGatewayService(); // Cashfree Payment Instance
//   bool? isSuccess;

//   @override
//   void initState() {
//     super.initState();
//     ref.read(pyamentRepositoryProvider).cfPaymentGatewayService;
//     // Attach events when payment is success and when error occured
//     ref
//         .read(pyamentRepositoryProvider)
//         .cfPaymentGatewayService
//         .setCallback(verifyPayment, onError);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Cashfree Payment Flutter Template'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//                 onPressed: () {
//                   // pay(
//                   //   orderID: 'orderID',
//                   //   orderAmount: 'orderAmount',
//                   //   customerId: 'customerId',
//                   //   customerName: 'customerName',
//                   //   customerEmail: 'customerEmail',
//                   //   customerPhoneNumber: 'customerPhoneNumber',
//                   // );
//                 },
//                 child: const Text("Pay")),
//             Text(
//               "Payment Status $isSuccess",
//               style: const TextStyle(fontSize: 20),
//             )
//           ],
//         ),
//       ),
//     );
//   } // When payment is done successfully

//   String orderId = "my_order_id1";

//   void verifyPayment(String orderId) {
//     // Here we will only print the statement
//     // to check payment is done or not
//     isSuccess = true;
//     setState(() {});
//     safePrint("Verify Payment $orderId");
//   }

// // If some error occur during payment this will trigger
//   void onError(CFErrorResponse errorResponse, String orderId) {
//     // printing the error message so that we can show
//     // it to user or checkourselves for testing
//     isSuccess = false;
//     setState(() {});
//     safePrint(errorResponse.getMessage());
//     safePrint("Error while making payment");
//   }
// }
