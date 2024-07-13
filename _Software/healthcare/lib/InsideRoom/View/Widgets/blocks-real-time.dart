import 'package:flutter/material.dart';

class blocks_real_time  extends StatelessWidget {
  blocks_real_time ({super.key, required this.first, required this.second,required this.image});
  String first;
  String second;
  String image;
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
              SizedBox(
                height: 10,
              ),
              Text(
                first,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(width: 12,),
                  Text(
                second,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
              SizedBox(width: 5,),
              Image.asset(image,
              width: 70,
              height: 60,
              ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
