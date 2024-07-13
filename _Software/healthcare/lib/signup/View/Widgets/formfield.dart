import 'package:flutter/material.dart';

class SignFormField extends StatelessWidget {
 

  final String hint;

  final Widget? icon1;
  final TextInputType type;

  const SignFormField({
    super.key,
    required this.hint,
    required this.type,
    this.icon1,
  });

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        cursorColor:  const Color(0xff2e001c),
        keyboardType: type,
        style: const TextStyle(
          color:  Color(0xff2e001c),
          fontSize: 16,
        ),
        decoration: InputDecoration(
          prefixIcon: icon1,
         // suffixIcon: icon2,
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color.fromARGB(172, 46, 0, 28),
            fontSize: 16,
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 3, color: Color.fromARGB(172, 46, 0, 28)),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 3, color: Color(0xff2e001c)),
          ),
        ),
      ),
    );
  }
}
