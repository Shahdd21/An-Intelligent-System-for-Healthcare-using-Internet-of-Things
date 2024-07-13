import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

import 'Widgets/gride_view.dart';

class RoomScreen extends StatelessWidget {
  final Spreadsheet ss;
  const RoomScreen({super.key,required this.ss});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: IconThemeData(color: Colors.black),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xffcaf2f4),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
              ))
        ],
      ),
      backgroundColor: const Color(0xffcaf2f4),
      body:  SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'ICU Rooms',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ),
            ),
          ),
          GrideViewWidget(ss: ss,),
        ],
      )),
    );
  }
}
