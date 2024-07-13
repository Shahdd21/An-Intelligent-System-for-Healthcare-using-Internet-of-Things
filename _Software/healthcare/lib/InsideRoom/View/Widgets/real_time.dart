import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:healthcare/InsideRoom/View/Widgets/blocks-real-time.dart';

class RealTimeWidget extends StatefulWidget {
  final Spreadsheet ss;
  const RealTimeWidget({required this.ss,super.key});
  
  @override
  State<RealTimeWidget> createState() => _RealTimeWidgetState();
}

class _RealTimeWidgetState extends State<RealTimeWidget> {

  DateTime lastDateTime = DateTime.now();
  double lastTemp = 0.0;
  double lastHumidity = 0.0;
  double Hydrogen = 0.0;
  double Methan = 0.0;
  double lastHeart = 0.0;

  @override
  void initState() {
    super.initState();
    fetchLastValues(widget.ss);
    Timer.periodic(Duration(seconds: 5), (timer) => fetchLastValues(widget.ss));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Container(
              width: 120,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xff2e001c),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text('Vital-Signs',
                style: TextStyle(color: Colors.white),
                ),
              ),
            ),
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
                height: 120,
                child: Column(
                  children: [
                    Text(
                        'Heart-Rate',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Image.asset('assets/image/heart_rate.png',
                        width: 100,
                        height: 50,
                        ),
                        Text(
                        '$lastHeart',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ],
                    )
              
                  ],
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(width: 10,),
                blocks_real_time(first: 'OxygenSaturation', second: '90%', image: 'assets/image/fire.png'),
                blocks_real_time(first: 'Temperatue', second: '37', image: 'assets/image/temp.png')
              ],
            ),
            Container(
              width: 120,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xff2e001c),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text('Environmental',
                style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(width: 10,),
                blocks_real_time(first: 'Hydrogen', second: '$Hydrogen', image: 'assets/image/fames.jpg'),
                blocks_real_time(first: 'Propan&methan', second: '$Methan', image: 'assets/image/gas-removebg-preview.png')
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                SizedBox(width: 10,),
                blocks_real_time(first: 'Humidity', second: '$lastHumidity'' F', image: 'assets/image/Air quality.png'),
                blocks_real_time(first: 'Temperature', second: '$lastTemp''C', image: 'assets/image/hamidity.png')
              ],
            ),
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
                height: 120,
                child: Column(
                  children: [
                    Text(
                        'Date',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10,),
                    Text(
                        '$lastDateTime',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> fetchLastValues(Spreadsheet ss) async {
  final sheet = ss.worksheetByTitle('Sheet1');
  if (sheet == null) return;

  final rows = await sheet.values.allRows();
  if (rows.isEmpty) return;

  final lastRow = rows.last;

  setState(() {
      lastDateTime = DateTime.tryParse('${lastRow[0]}   ${lastRow[1]}') ?? DateTime.now();
      lastTemp = double.tryParse(lastRow[2]) ?? 0.0;
      lastHumidity = double.tryParse(lastRow[3]) ?? 0.0;
      Hydrogen = double.tryParse(lastRow[4]) ?? 0.0;
      Methan = double.tryParse(lastRow[5]) ?? 0.0;
      lastHeart = double.tryParse(lastRow[6]) ?? 0.0;
    });
}
}
