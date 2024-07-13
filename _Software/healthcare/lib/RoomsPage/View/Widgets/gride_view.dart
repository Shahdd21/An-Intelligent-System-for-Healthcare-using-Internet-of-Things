import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

import '../../../InsideRoom/View/room_one.dart';

class GrideViewWidget extends StatelessWidget {
  final Spreadsheet ss;
  const GrideViewWidget({super.key, required this.ss});

  @override
  Widget build(BuildContext context) {
    void _navigateToRoom(int roomNumber) {
      Widget roomScreen;

      switch (roomNumber) {
        case 1:
          roomScreen =  RoomOneScreen(ss: ss);
          break;
        // case 2:
        //   roomScreen = const Room2Screen();
        //   break;
        // case 3:
        //   roomScreen = const Room3Screen();
        //   break;
        // case 4:
        //   roomScreen = const Room4Screen();
        //   break;
        // case 5:
        //   roomScreen = const Room5Screen();
        //   break;
        // case 6:
        //   roomScreen = const Room6Screen();
        //   break;
        // case 7:
        //   roomScreen = const Room7Screen();
        //   break;
        // case 8:
        //   roomScreen = const Room8Screen();
        //   break;
        default:
          roomScreen = Scaffold(
            appBar: AppBar(
              title: Text('Room $roomNumber'),
            ),
            body: Center(
              child: Text(
                'Details for Room $roomNumber',
                style: const TextStyle(fontSize: 24),
              ),
            ),
          );
          break;
      }

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => roomScreen),
      );
    }

    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          padding: const EdgeInsets.only(top: 0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 120,
            crossAxisSpacing: 20,
            mainAxisSpacing: 40,
          ),
          itemCount: 8,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _navigateToRoom(index + 1),
              child: Card(
                color: const Color(0xff2e001c),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    'Room ${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
