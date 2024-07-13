import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:healthcare/InsideRoom/View/Widgets/patient-data.dart';

import 'Widgets/card.dart';
import 'Widgets/insights.dart';
import 'Widgets/real_time.dart';

class RoomOneScreen extends StatefulWidget {
  final Spreadsheet ss;
  const RoomOneScreen({Key? key,required this.ss}) : super(key: key);

  @override
  _RoomOneScreenState createState() => _RoomOneScreenState();
}

class _RoomOneScreenState extends State<RoomOneScreen> {
  Color card1Color = const Color(0xff2e001c);
  Color card1TextColor = Colors.white;
  Color card2Color = const Color(0xffcaf2f4);
  Color card2TextColor = Color.fromARGB(255, 36, 22, 31);
  Color card3Color = const Color(0xffcaf2f4);
  Color card3TextColor = const Color(0xff2e001c);
  int _selectedContent = 1; // 1 for Patient-data, 2 for Real-Time Data, 3 for Insights

  void _toggleColors(int selectedContent) {
    setState(() {
      if (selectedContent == 1) {
        card1Color = const Color(0xff2e001c);
        card1TextColor = Colors.white;
        card2Color = const Color(0xffcaf2f4);
        card2TextColor = const Color(0xff2e001c);
        card3Color = const Color(0xffcaf2f4);
        card3TextColor = const Color(0xff2e001c);
      } else if (selectedContent == 2) {
        card1Color = const Color(0xffcaf2f4);
        card1TextColor = const Color(0xff2e001c);
        card2Color = const Color(0xff2e001c);
        card2TextColor = Colors.white;
        card3Color = const Color(0xffcaf2f4);
        card3TextColor = const Color(0xff2e001c);
      } else if (selectedContent == 3) {
        card1Color = const Color(0xffcaf2f4);
        card1TextColor = const Color(0xff2e001c);
        card2Color = const Color(0xffcaf2f4);
        card2TextColor = const Color(0xff2e001c);
        card3Color = const Color(0xff2e001c);
        card3TextColor = Colors.white;
      }
      _selectedContent = selectedContent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Room1'),
        backgroundColor: const Color(0xff2e001c),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(height: 10),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CardWidget(
                    text: 'Patient-data',
                    clr: card1Color,
                    textclr: card1TextColor,
                    onTap: () => _toggleColors(1),
                  ),
                  CardWidget(
                    text: 'Real-Time Data',
                    clr: card2Color,
                    textclr: card2TextColor,
                    onTap: () => _toggleColors(2),
                  ),
                  CardWidget(
                    text: 'Insights',
                    clr: card3Color,
                    textclr: card3TextColor,
                    onTap: () => _toggleColors(3),
                  ),
                ],
              ),
            ),
            if (_selectedContent == 1) ...[
              const patient_data(),
            ] else if (_selectedContent == 2) ...[
               // ignore: prefer_const_constructors
               RealTimeWidget(ss: widget.ss),
            ] else if (_selectedContent == 3) ...[
                InsightsWidget(),
            ],
          ],
        ),
      ),
    );
  }
}
