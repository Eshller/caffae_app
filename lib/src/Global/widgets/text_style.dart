import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

TextStyle appStyle(
    {required FontWeight? fw,
    required double? fontSize,
    required Color? color}) {
  return GoogleFonts.poppins(
    fontWeight: fw,
    fontSize: fontSize,
    color: color,
  );
}
