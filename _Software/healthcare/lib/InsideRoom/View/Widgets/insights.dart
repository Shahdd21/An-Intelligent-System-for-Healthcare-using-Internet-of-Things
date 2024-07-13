import 'package:flutter/material.dart';

import '../../Data/data.dart';

class InsightsWidget extends StatelessWidget {
  final int oxygenSaturation = 90; // Fixed value for oxygen saturation
  final double temperature = 37.0; // Fixed value for temperature

  InsightsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    

    // Splitting the detection results into a list for GridView

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: GridView.builder(
            padding: const EdgeInsets.only(top: 0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisExtent: 100,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: insightsDataList.length,
            itemBuilder: (context, index) {
              final insightText = insightsDataList[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromRGBO(232, 232, 232, 0.32),
                        Color.fromRGBO(142, 202, 205, 0.7),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      'insightText',
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}