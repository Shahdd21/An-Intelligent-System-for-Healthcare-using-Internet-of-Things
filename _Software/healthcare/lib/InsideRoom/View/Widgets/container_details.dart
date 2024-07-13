import 'package:flutter/material.dart';

import '../../Data/data.dart';

class ContainerDetails extends StatelessWidget {
  const ContainerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.builder(
        padding: const EdgeInsets.only(top: 0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width < 100 ? 1 : 2,
          mainAxisExtent: 250,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: containerDataList.length,
        itemBuilder: (context, index) {
          final data = containerDataList[index];
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xffcaf2f4),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (data.subtitleone != null)
                  Text(
                    data.subtitleone!,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                if (data.subtitletwo != null)
                  Text(
                    data.subtitletwo!,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                const SizedBox(height: 10,),
                if (data.img != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Image.asset(
                        data.img!,
                        width: 100,
                        height: 100,
                        alignment: Alignment.centerRight,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
