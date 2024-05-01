import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../classes/in_progress_class.dart';

class InProgressCard extends StatelessWidget {
  final InProgressClass card;

  const InProgressCard({required this.card, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 10),
      height: 200,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: card.colorOfContainer.withOpacity(0.3),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: 30,
              width: 150,
              margin: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                card.typeOfTask,
                style: const TextStyle(color: Color(0xff999bac)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 30,
              margin: const EdgeInsets.only(top: 20, right: 20),
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: card.colorOfTaskIcon.withOpacity(0.4),
              ),
              child: Icon(
                card.taskIcon,
                color: card.colorOfTaskIcon,
              ),
            ),
          ),
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                height: 80,
                child: Text(
                  card.nameOfTask,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ),),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: LinearPercentIndicator(
                animation: true,
                padding: EdgeInsets.zero,
                lineHeight: 9.0,
                percent: card.percentOfTask,
                barRadius:const  Radius.circular(10),
                backgroundColor: Colors.white,
                progressColor: card.colorOfContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
