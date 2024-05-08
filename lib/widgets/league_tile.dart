import 'package:flutter/material.dart';
import 'package:soccer_info/models/league.dart';
import 'package:soccer_info/widgets/match_tile.dart';

class LeagueTile extends StatelessWidget {
  final LeagueModel league;

  const LeagueTile({super.key, required this.league});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 6),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.green.shade300, width: 2),
                  ),
                ),
                child: Text(
                  league.leagueName,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: TextButton.icon(
                    style: TextButton.styleFrom(
                      minimumSize: Size.zero, // Set this
                      padding: EdgeInsets.zero, // and this
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.chevron_left,
                      color: Colors.green.shade300,
                    ),
                    label: Text(
                      "المزيد",
                      style: TextStyle(
                        color: Colors.green.shade300,
                      ),
                    )),
              )
            ],
          ),
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: league.matches.length,
            itemBuilder: (context, matchIndex) {
              Team home = league.matches[matchIndex].home;
              Team away = league.matches[matchIndex].away;

              String status = league.matches[matchIndex].status;
              String? time = league.matches[matchIndex].time;
              return MatchTile(
                  home: home, away: away, status: status, time: time);
            },
          )
        ],
      ),
    );
  }
}
