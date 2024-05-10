import 'package:flutter/material.dart';
import 'package:soccer_info/models/match_stats.dart';
import 'package:soccer_info/widgets/stats_bar.dart';

class MatchStatBarsContainer extends StatelessWidget {
  final MatchStats data;
  const MatchStatBarsContainer({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StatsBar(
          statName: "الاستحواذ",
          homeStat: data.possession.home,
          awayStat: data.possession.away,
        ),
        StatsBar(
          statName: "التسديدات",
          homeStat: data.shots.home,
          awayStat: data.shots.away,
        ),
        StatsBar(
          statName: "التسديدات على المرمى",
          homeStat: data.targetShots.home,
          awayStat: data.targetShots.away,
        ),
        StatsBar(
          statName: "التصديات",
          homeStat: data.saves.home,
          awayStat: data.saves.away,
        ),
        StatsBar(
          statName: "الكروت الصفراء",
          homeStat: data.yellowCards.home,
          awayStat: data.yellowCards.away,
        ),
        StatsBar(
          statName: "الكروت الحمراء",
          homeStat: data.redCards.home,
          awayStat: data.redCards.away,
        ),
        StatsBar(
          statName: "الأخطاء",
          homeStat: data.fouls.home,
          awayStat: data.fouls.away,
        ),
        StatsBar(
          statName: "التسلل",
          homeStat: data.offside.home,
          awayStat: data.offside.away,
        ),
      ],
    );
  }
}
