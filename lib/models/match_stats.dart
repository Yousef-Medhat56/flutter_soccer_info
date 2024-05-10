class MatchStats {
  final String matchId;
  final TeamsInStat possession;
  final TeamsInStat goals;
  final TeamsInStat yellowCards;
  final TeamsInStat redCards;
  final TeamsInStat shots;
  final TeamsInStat targetShots;
  final TeamsInStat offside;
  final TeamsInStat saves;
  final TeamsInStat fouls;

  MatchStats({
    required this.matchId,
    required this.possession,
    required this.goals,
    required this.yellowCards,
    required this.redCards,
    required this.shots,
    required this.targetShots,
    required this.offside,
    required this.saves,
    required this.fouls,
  });

  factory MatchStats.fromJson(Map<String, dynamic> json) => MatchStats(
        matchId: json["matchId"],
        possession: TeamsInStat.fromJson(json["possession"]),
        goals: TeamsInStat.fromJson(json["goals"]),
        yellowCards: TeamsInStat.fromJson(json["yellowCards"]),
        redCards: TeamsInStat.fromJson(json["redCards"]),
        shots: TeamsInStat.fromJson(json["shots"]),
        targetShots: TeamsInStat.fromJson(json["targetShots"]),
        offside: TeamsInStat.fromJson(json["offside"]),
        saves: TeamsInStat.fromJson(json["saves"]),
        fouls: TeamsInStat.fromJson(json["fouls"]),
      );

  Map<String, dynamic> toJson() => {
        "matchId": matchId,
        "possession": possession.toJson(),
        "goals": goals.toJson(),
        "yellowCards": yellowCards.toJson(),
        "redCards": redCards.toJson(),
        "shots": shots.toJson(),
        "targetShots": targetShots.toJson(),
        "offside": offside.toJson(),
        "saves": saves.toJson(),
        "fouls": fouls.toJson(),
      };
}

class TeamsInStat {
  final int home;
  final int away;

  TeamsInStat({
    required this.home,
    required this.away,
  });

  factory TeamsInStat.fromJson(Map<String, dynamic> json) => TeamsInStat(
        home: json["home"],
        away: json["away"],
      );

  Map<String, dynamic> toJson() => {
        "home": home,
        "away": away,
      };
}
