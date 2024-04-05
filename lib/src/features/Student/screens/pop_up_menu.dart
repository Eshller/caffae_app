 
// ignore_for_file: public_member_api_docs, sort_constructors_first


// import 'package:caffae_app/src/Global/Export/export.dart';
// import 'package:flutter/material.dart';

// class PopMenuHolder extends StatelessWidget {
//   final List<Widget> children;

//   const PopMenuHolder(
//       {Key? key, required this.children, required this.controller})
//       : super(key: key);
// s
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 13),
//       child: Row(
//         children: [
//           Row(
//             children: [
//               ReusableText(
//                 text: 'Sort',
//                 textStyle: appStyle(
//                   fw: customFont500Weight,
//                   fontSize: 12,
//                   color: blackColor,
//                 ),
//               ),
//               const SizedBox(width: 4),
//               InkWell(
//                 onTap: () {},
//                 child: CustomPopupMenu(
//                   menuBuilder: () => ClipRRect(
//                     borderRadius: BorderRadius.circular(5),
//                     child: Container(
//                       width: 100,
//                       color: const Color(0xFF4C4C4C),
//                       child: IntrinsicWidth(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.stretch,
//                           children: children,
//                         ),
//                       ),
//                     ),
//                   ),
//                   pressType: PressType.singleClick,
//                   verticalMargin: -13,
//                   controller: controller,
//                   child: const Icon(Icons.sort, color: Colors.black),
//                 ),
//               )
//             ],
//           ),
//           const SizedBox(
//             width: 13,
//           ),
//           // Row(
//           //   children: [
//           //     ReusableText(
//           //       text: 'Filter',
//           //       textStyle: appStyle(
//           //         fw: customFont500Weight,
//           //         fontSize: 12,
//           //         color: blackColor,
//           //       ),
//           //     ),
//           //     Container(
//           //       height: 20,
//           //       width: 20,
//           //       decoration: const BoxDecoration(
//           //         image: DecorationImage(
//           //           fit: BoxFit.cover,
//           //           image: AssetImage('assets/images/filter.png'),
//           //         ),
//           //       ),
//           //     ),
//           //   ],
//           // )
//         ],
//       ),
//     );
//   }
// }
 