import 'package:soccer_info/models/league.dart';

class TeamStandings {
  final int order;
  final Team teamData;
  final int matchesPlayed;
  final int wins;
  final int draws;
  final int losses;
  final int goalsFor;
  final int goalsAgainst;
  final int goalsDiff;
  final int points;

  TeamStandings({
    required this.order,
    required this.teamData,
    required this.matchesPlayed,
    required this.wins,
    required this.draws,
    required this.losses,
    required this.goalsFor,
    required this.goalsAgainst,
    required this.goalsDiff,
    required this.points,
  });

  factory TeamStandings.fromJson(Map<String, dynamic> json) => TeamStandings(
        order: json["order"],
        teamData: Team.fromJson(json["teamData"]),
        matchesPlayed: json["matchesPlayed"],
        wins: json["wins"],
        draws: json["draws"],
        losses: json["losses"],
        goalsFor: json["goalsFor"],
        goalsAgainst: json["goalsAgainst"],
        goalsDiff: json["goalsDiff"],
        points: json["points"],
      );

  Map<String, dynamic> toJson() => {
        "order": order,
        "teamData": teamData.toJson(),
        "matchesPlayed": matchesPlayed,
        "wins": wins,
        "draws": draws,
        "losses": losses,
        "goalsFor": goalsFor,
        "goalsAgainst": goalsAgainst,
        "goalsDiff": goalsDiff,
        "points": points,
      };
}

class GroupStandings {
  final String? groupName;
  final List<TeamStandings> standings;

  GroupStandings({required this.groupName, required this.standings});

  factory GroupStandings.fromJson(Map<String, dynamic> json) => GroupStandings(
        groupName: json["groupName"],
        standings: _parseTeamStandings(json["standings"])!,
      );

  Map<String, dynamic> toJson() => {
        "groupName": groupName,
        "standings": standings.map(
          (e) => e.toJson(),
        ),
      };

  static List<TeamStandings>? _parseTeamStandings(dynamic teamStandingsJson) {
    if (teamStandingsJson is List) {
      return teamStandingsJson
          .map((json) => TeamStandings.fromJson(json))
          .toList();
    }
    return null;
  }
}

class LeagueStandings {
  final List<GroupStandings> groups;

  LeagueStandings({required this.groups});

  factory LeagueStandings.fromJson(Map<String, dynamic> json) =>
      LeagueStandings(
        groups: _parseGroupStandings(json["groups"])!,
      );

  Map<String, dynamic> toJson() => {
        "groups": groups.map(
          (e) => e.toJson(),
        ),
      };

  static List<GroupStandings>? _parseGroupStandings(
      dynamic groupStandingsJson) {
    if (groupStandingsJson is List) {
      return groupStandingsJson
          .map((json) => GroupStandings.fromJson(json))
          .toList();
    }
    return null;
  }
}

class LeagueInfo {
  final String leagueName;

  LeagueInfo({required this.leagueName});

  factory LeagueInfo.fromJson(Map<String, dynamic> json) => LeagueInfo(
        leagueName: json["leagueName"],
      );

  Map<String, dynamic> toJson() => {
        "leagueName": leagueName,
      };
}
