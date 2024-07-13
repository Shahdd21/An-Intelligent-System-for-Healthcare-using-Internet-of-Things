import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  final String hint;
  final TextInputType type;
  final TextEditingController controller;

  const AuthTextFormField({
    Key? key,
    required this.hint,
    required this.type,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      keyboardType: type,
    );
  }
}
