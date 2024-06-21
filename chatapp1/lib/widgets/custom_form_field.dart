import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String hintText;
  final double height;
  final bool obscureText;
  final RegExp validationRegEx;
  const CustomFormField(
      {super.key,
      required this.hintText,
      required this.height,
      required this.obscureText,
      required this.validationRegEx});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
      ),
      child: SizedBox(
        height: height,
        child: TextFormField(
          validator: (value) {
            if (value != null && validationRegEx.hasMatch(value)) {
              return null;
            }
            return "Enter a valid ${hintText.toLowerCase()}";
          },
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
