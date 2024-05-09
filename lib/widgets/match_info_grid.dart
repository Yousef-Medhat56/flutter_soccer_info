import 'package:flutter/material.dart';
import 'package:soccer_info/models/match_overview.dart';

class MatchInfoGrid extends StatelessWidget {
  final MatchInfo info;
  const MatchInfoGrid({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    List infoList = [];
    if (info.matchDate != null) {
      infoList
          .add({"icon": Icons.calendar_month_outlined, "text": info.matchDate});
    }
    if (info.matchTime != null) {
      infoList.add({"icon": Icons.schedule, "text": info.matchTime});
    }
    if (info.stadium != null) {
      infoList.add({"icon": Icons.stadium_outlined, "text": info.stadium});
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 0.35,
          crossAxisSpacing: 32,
        ),
        shrinkWrap: true,
        itemCount: infoList.length,
        itemBuilder: (context, index) => Row(
          children: [
            Icon(
              infoList[index]["icon"],
              color: Colors.green.shade300,
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                infoList[index]["text"],
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
