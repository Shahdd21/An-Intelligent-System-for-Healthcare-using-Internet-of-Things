import 'package:flutter/material.dart';
import 'package:healthcare/InsideRoom/View/Widgets/patient-container.dart';
import 'package:healthcare/InsideRoom/View/Widgets/patient-with-image.dart';

class patient_data extends StatelessWidget {
  const patient_data({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xffcaf2f4),
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
                width: 300, // Adjusted width to fit image and progress circle
                height: 100,
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 150),
                      child: Text(
                        'Patient-Name',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text('Emam Ashour',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(width: 10,),
                Patient_Container(first: 'Age', second: '32'),
                Patient_Container(first: 'ID', second: '13648'),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 10,),
                Patient_with_Image(first: 'Male', second: 'assets/image/male.jpg'),
                Patient_with_Image(first: 'Disease', second: 'assets/image/Sugar disease.png'),
              ],
            ),
            SizedBox(height: 10,),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xffcaf2f4),
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
                width: 300, // Adjusted width to fit image and progress circle
                height: 150,
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 150),
                      child: Text(
                        'Location',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text('Room Number : 1',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )),
                        SizedBox(height: 5,),
                    Text('Floor Number : 3',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
