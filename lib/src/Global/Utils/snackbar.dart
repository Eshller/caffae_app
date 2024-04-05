
import 'package:flutter/material.dart';

import '../widgets/reusable_text.dart';
import '../widgets/text_style.dart';

void snackbar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: ReusableText(
      text: content,
      textStyle: appStyle(
        fw: FontWeight.w500,
        fontSize: 16,
        color: Colors.black,
      ),
    )),
  );
}
