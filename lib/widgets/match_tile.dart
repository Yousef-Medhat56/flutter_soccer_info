import 'package:flutter/material.dart';
import 'package:soccer_info/models/league.dart';
import 'package:soccer_info/widgets/match_score.dart';
import 'package:soccer_info/widgets/team_tile.dart';

class MatchTile extends StatelessWidget {
  final Team home;
  final Team away;
  final String status;
  final String? time;

  const MatchTile(
      {super.key,
      required this.home,
      required this.away,
      required this.status,
      this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(239, 241, 243, 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
              flex: 1, child: TeamTile(teamName: home.name, teamImg: home.img)),
          Flexible(
            flex: 2,
            child: MatchScore(
              status: status,
              time: time,
              homeGoals: home.goals,
              awayGoals: away.goals,
            ),
          ),
          Flexible(
            flex: 1,
            child: TeamTile(teamName: away.name, teamImg: away.img),
          ),
        ],
      ),
    );
  }
}
