import 'package:flutter/material.dart';

class MatchScore extends StatelessWidget {
  final String status;
  final String? time;
  final String? homeGoals;
  final String? awayGoals;

  const MatchScore({
    super.key,
    required this.status,
    this.homeGoals,
    this.awayGoals,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    Map matchStatus = {
      "not started": {"text": "لم تبدأ", "color": Colors.green.shade300},
      "finished": {"text": "انتهت", "color": Colors.grey.shade400},
      "live": {"text": "مباشر", "color": Colors.red.shade400},
    };
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          homeGoals ?? "-",
          style: TextStyle(
              color: Colors.green.shade300,
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              color: matchStatus[status]["color"],
              child: Text(matchStatus[status]["text"],
                  style: const TextStyle(
                    color: Colors.white,
                  )),
            ),
            time != null
                ? Column(
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        time!,
                        style: TextStyle(color: Colors.grey.shade800),
                      )
                    ],
                  )
                : Container()
          ],
        ),
        Text(awayGoals ?? "-",
            style: TextStyle(
                color: Colors.green.shade300,
                fontWeight: FontWeight.bold,
                fontSize: 22)),
      ],
    );
  }
}

class MatchScoreVarient extends StatelessWidget {
  final String status;
  final String? homeGoals;
  final String? awayGoals;

  const MatchScoreVarient({
    super.key,
    required this.status,
    this.homeGoals,
    this.awayGoals,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        awayGoals ?? "-",
        style: TextStyle(
            color: Colors.green.shade300,
            fontWeight: FontWeight.bold,
            fontSize: 22),
      ),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        child: Text(status,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.bold,
            )),
      ),
      Text(homeGoals ?? "-",
          style: TextStyle(
              color: Colors.green.shade300,
              fontWeight: FontWeight.bold,
              fontSize: 22)),
    ]);
  }
}
