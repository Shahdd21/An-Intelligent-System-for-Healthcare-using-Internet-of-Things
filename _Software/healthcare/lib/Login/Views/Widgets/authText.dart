import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
 

  final String hint;

  final Widget? icon2;
  final TextInputType type;

  const AuthTextFormField({
    super.key,
    required this.hint,
    required this.type,
    this.icon2,
  });

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        cursorColor:  const Color(0xffcaf2f4),
        keyboardType: type,
        style: const TextStyle(
          color:  Color(0xff6df1fd),
          fontSize: 16,
        ),
        decoration: InputDecoration(
          //prefixIcon: Icon(icon),
          suffixIcon: icon2,
          hintText: hint,
          hintStyle: const TextStyle(
            color:  Color(0xffcaf2f4),
            fontSize: 16,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 3, color: Color(0xFFCBE1F8)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 3, color: Color(0xffcaf2f4)),
          ),
        ),
      ),
    );
  }
}
