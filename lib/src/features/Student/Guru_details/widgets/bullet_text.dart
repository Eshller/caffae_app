import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BulletText extends StatelessWidget {
  final String text;

  const BulletText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final paragraphs = text.split('. ');

    return RichText(
      text: TextSpan(
        children: List.generate(paragraphs.length, (index) {
          final paragraph = paragraphs[index];
          final isFirstParagraph = index == 0;

          final bullet = isFirstParagraph ? '' : '\n• ';
          final textStyle = GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 11.2,
            color: const Color(0xFF000000),
          );

          return TextSpan(
            text: '$bullet $paragraph',
            style: textStyle,
          );
        }),
      ),
    );
  }
}
