import 'package:flutter/material.dart';
import 'package:soccer_info/models/match_overview.dart';
import 'package:soccer_info/widgets/match_info_grid.dart';
import 'package:soccer_info/widgets/match_score.dart';
import 'package:soccer_info/widgets/scorers_list.dart';
import 'package:soccer_info/widgets/team_tile.dart';

class MatchOverviewContainer extends StatelessWidget {
  final MatchOverview data;
  const MatchOverviewContainer({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          data.league.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: TeamTile(
                scale: 1.2,
                teamName: data.away.name,
                teamImg: data.away.img,
              ),
            ),
            Flexible(
              flex: 2,
              child: MatchScoreVarient(
                status: data.status,
                homeGoals: data.home.goals,
                awayGoals: data.away.goals,
              ),
            ),
            Flexible(
              flex: 1,
              child: TeamTile(
                scale: 1.2,
                teamName: data.home.name,
                teamImg: data.home.img,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ScorersList(
              isAway: true,
              scorers: data.away.scorers,
            ),
            ScorersList(
              isAway: false,
              scorers: data.home.scorers,
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        const Divider(),
        MatchInfoGrid(info: data.info)
      ],
    );
  }
}
