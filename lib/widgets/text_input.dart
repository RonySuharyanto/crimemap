import 'package:flutter/material.dart';

class TextInputForm extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final bool obscureText;
  final Widget prefixIcon;

  TextInputForm(
      {this.controller,
      this.keyboardType,
      this.hintText,
      this.obscureText = false,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
