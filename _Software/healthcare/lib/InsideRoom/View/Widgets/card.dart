import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String text;
  final Color clr;
  final Color textclr;
  final void Function()? onTap;
  const CardWidget({
    super.key, required this.text, required this.clr, required this.textclr, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: 120,
      child: InkWell(
        onTap: onTap ,
        child: Card(
          color: clr,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child:  Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style:  TextStyle(
                color: textclr,
                fontSize: 18.0,
                //fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
