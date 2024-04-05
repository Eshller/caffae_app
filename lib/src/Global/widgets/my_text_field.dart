// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormInput extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool? obscureText;
  final int? maxLines;

  final void Function(String?)? onSaved;
  final TextEditingController controller;
  final Widget? icon;
  Widget? suffixIcon;
  final String? Function(String?)? validator;
  int? maxLength;
  List<TextInputFormatter>? inputFormatters;
  TextInputType? keyboardType;
  TextFormInput({
    super.key,
    required this.hintText,
    required this.labelText,
    this.obscureText,
    this.maxLines = 1,
    this.onSaved,
    required this.controller,
    this.icon,
    this.validator,
    this.suffixIcon,
    this.maxLength,
    this.inputFormatters,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return TextFormField(
      maxLines: maxLines,
      maxLength: maxLength,
      onSaved: onSaved,
      obscureText: obscureText!,
      controller: controller,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      // style: const TextStyle(
      //   fontSize: 15.3,
      //   color: Color.fromARGB(255, 125, 116, 116),
      //   fontWeight: FontWeight.w600,
      // ),
      onChanged: (value) {},
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hoverColor: Colors.white,
        prefixIcon: icon,
        suffixIcon: suffixIcon,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 78, 63, 63), width: 1),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFee7b64), width: 2),
        ),
        focusColor: const Color.fromARGB(255, 207, 0, 0),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 1.0, horizontal: 15.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7.0),
        ),
        hintStyle: TextStyle(
          color: Colors.white,
          fontSize: screenWidth * 0.04,
          fontWeight: FontWeight.bold,
        ),
        hintText: hintText,
        labelText: labelText,
      ),
    );
  }
}
