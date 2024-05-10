import 'package:flutter/material.dart';

class StatsBar extends StatelessWidget {
  final String statName;
  final int homeStat;
  final int awayStat;
  const StatsBar({
    super.key,
    required this.statName,
    required this.homeStat,
    required this.awayStat,
  });

  @override
  Widget build(BuildContext context) {
    double homePercentage = homeStat / (homeStat + awayStat);
    double awayPercentage = awayStat / (homeStat + awayStat);

    const double BAR_WIDTH = 240;
    return Column(
      children: [
        Text(
          statName,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.grey.shade800),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$homeStat",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade600,
              ),
            ),
            Row(
              children: [
                Container(
                  height: 6,
                  color: Colors.grey.shade600,
                  width: homeStat != 0 ? homePercentage * BAR_WIDTH : 0,
                ),
                Container(
                  height: 6,
                  color: Colors.green.shade300,
                  width: awayStat != 0 ? awayPercentage * BAR_WIDTH : 0,
                ),
              ],
            ),
            Text(
              "$awayStat",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade300,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
