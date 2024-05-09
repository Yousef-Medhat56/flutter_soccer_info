import 'package:soccer_info/models/league.dart';

class LeagueOverview {
  final String name;
  final String url;

  LeagueOverview({
    required this.name,
    required this.url,
  });
  factory LeagueOverview.fromJson(Map<String, dynamic> json) => LeagueOverview(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class MatchInfo {
  final String? matchDate;
  final String? matchTime;
  final String? stadium;

  MatchInfo({
    required this.matchDate,
    required this.matchTime,
    required this.stadium,
  });

  factory MatchInfo.fromJson(Map<String, dynamic> json) => MatchInfo(
        matchDate: json["matchDate"],
        matchTime: json["matchTime"],
        stadium: json["stadium"],
      );

  Map<String, dynamic> toJson() => {
        "matchDate": matchDate,
        "matchTime": matchTime,
        "stadium": stadium,
      };
}

class MatchOverview {
  final Team home;
  final Team away;
  final String status;
  final LeagueOverview league;
  final MatchInfo info;

  MatchOverview({
    required this.home,
    required this.away,
    required this.status,
    required this.league,
    required this.info,
  });
  factory MatchOverview.fromJson(Map<String, dynamic> json) => MatchOverview(
        home: Team.fromJson(json["home"]),
        away: Team.fromJson(json["away"]),
        status: json["status"],
        league: LeagueOverview.fromJson(json["league"]),
        info: MatchInfo.fromJson(json["info"]),
      );

  Map<String, dynamic> toJson() => {
        "home": home.toJson(),
        "away": away.toJson(),
        "status": status,
        "league": league.toJson(),
        "info": info.toJson(),
      };
}
