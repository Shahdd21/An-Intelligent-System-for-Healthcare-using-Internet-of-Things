import 'package:flutter/material.dart';

class Patient_with_Image extends StatelessWidget {
  Patient_with_Image ({super.key, required this.first, required this.second});
  String first;
  String second;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Container(
          height: 120,
          width: 150,
          decoration: BoxDecoration(
            color: Color(0xffcaf2f4),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(height: 10,),
              Text(
                first,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 15,),
              Image.asset(second,
              width: 70,
              height: 70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
