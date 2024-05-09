import 'dart:convert';

LeagueModel leagueModelFromJson(String str) =>
    LeagueModel.fromJson(json.decode(str));

String leagueModelToJson(LeagueModel data) => json.encode(data.toJson());

class LeagueModel {
  final String leagueId;
  final String leagueSlug;
  final String leagueName;
  final String leagueImg;
  final List<Match> matches;

  LeagueModel({
    required this.leagueId,
    required this.leagueSlug,
    required this.leagueName,
    required this.leagueImg,
    required this.matches,
  });

  factory LeagueModel.fromJson(Map<String, dynamic> json) => LeagueModel(
        leagueId: json["leagueId"],
        leagueSlug: json["leagueSlug"],
        leagueName: json["leagueName"],
        leagueImg: json["leagueImg"],
        matches:
            List<Match>.from(json["matches"].map((x) => Match.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "leagueId": leagueId,
        "leagueSlug": leagueSlug,
        "leagueName": leagueName,
        "leagueImg": leagueImg,
        "matches": List<dynamic>.from(matches.map((x) => x.toJson())),
      };
}

class Match {
  final String id;
  final String status;
  final String? time;

  final Team home;
  final Team away;

  Match({
    required this.id,
    required this.status,
    required this.time,
    required this.home,
    required this.away,
  });

  factory Match.fromJson(Map<String, dynamic> json) => Match(
        id: json["id"],
        status: json["status"],
        time: json["time"],
        home: Team.fromJson(json["home"]),
        away: Team.fromJson(json["away"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "time": time,
        "home": home.toJson(),
        "away": away.toJson(),
      };
}

class Scorer {
  final String name;
  final String time;

  Scorer({required this.name, required this.time});
  factory Scorer.fromJson(Map<String, dynamic> json) => Scorer(
        name: json["name"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "time": time,
      };
}

class Team {
  final String name;
  final String img;
  final String url;
  final String? goals;
  final List<Scorer>? scorers;

  Team({
    required this.name,
    required this.img,
    required this.url,
    this.goals,
    this.scorers,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        name: json["name"],
        img: json["img"],
        url: json["url"],
        goals: json["goals"],
        scorers: _parseScorers(json["scorers"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "img": img,
        "url": url,
        "goals": goals,
        "scorers": scorers?.map(
          (e) => e.toJson(),
        ),
      };

  static List<Scorer>? _parseScorers(dynamic scorersJson) {
    if (scorersJson is List) {
      return scorersJson.map((json) => Scorer.fromJson(json)).toList();
    }
    return null;
  }
}
