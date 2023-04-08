class MatchFootball {
    MatchFootball({
        required this.area,
        required this.competition,
        required this.season,
        required this.id,
        required this.utcDate,
        required this.status,
        required this.matchday,
        required this.stage,
        this.group,
        required this.lastUpdated,
        required this.homeTeam,
        required this.awayTeam,
        required this.score,
        required this.referees,
    });

    Area area;
    Competition competition;
    Season season;
    int id;
    DateTime utcDate;
    String status;
    int matchday;
    String stage;
    String? group;
    DateTime lastUpdated;
    Team homeTeam;
    Team awayTeam;
    Score score;
    List<Referee> referees;

    factory MatchFootball.fromJson(Map<String, dynamic> json) => MatchFootball(
        area: Area.fromJson(json["area"]),
        competition: Competition.fromJson(json["competition"]),
        season: Season.fromJson(json["season"]),
        id: json["id"],
        utcDate: DateTime.parse(json["utcDate"]),
        status: json["status"],
        matchday: json["matchday"],
        stage: json["stage"],
        group: json["group"],
        lastUpdated: DateTime.parse(json["lastUpdated"]),
        homeTeam: Team.fromJson(json["homeTeam"]),
        awayTeam: Team.fromJson(json["awayTeam"]),
        score: Score.fromJson(json["score"]),
        referees: List<Referee>.from(json["referees"].map((x) => Referee.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "area": area.toJson(),
        "competition": competition.toJson(),
        "season": season.toJson(),
        "id": id,
        "utcDate": utcDate.toIso8601String(),
        "status": status,
        "matchday": matchday,
        "stage": stage,
        "group": group,
        "lastUpdated": lastUpdated.toIso8601String(),
        "homeTeam": homeTeam.toJson(),
        "awayTeam": awayTeam.toJson(),
        "score": score.toJson(),
        "referees": List<dynamic>.from(referees.map((x) => x.toJson())),
    };
}


class Area {
    Area({
        required this.id,
        required this.name,
        required this.code,
        required this.flag,
    });

    int id;
    String name;
    String code;
    String flag;

    factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        flag: json["flag"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "flag": flag,
    };
}

class Team {
    Team({
        required this.id,
        required this.name,
        required this.shortName,
        this.tla,
        required this.crest,
    });

    int id;
    String name;
    String shortName;
    String? tla;
    String crest;

    factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        shortName: json["shortName"],
        tla: json["tla"],
        crest: json["crest"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "shortName": shortName,
        "tla": tla,
        "crest": crest,
    };
}

class Competition {
    Competition({
        required this.id,
        required this.name,
        required this.code,
        required this.type,
        required this.emblem,
    });

    int id;
    String name;
    String code;
    String type;
    String emblem;

    factory Competition.fromJson(Map<String, dynamic> json) => Competition(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        type: json["type"],
        emblem: json["emblem"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "type": type,
        "emblem": emblem,
    };
}


class Score {
    Score({
        required this.winner,
        required this.duration,
        required this.fullTime,
        required this.halfTime,
    });

    String winner;
    String duration;
    TimeMatch fullTime;
    TimeMatch halfTime;

    factory Score.fromJson(Map<String, dynamic> json) => Score(
        winner: json["winner"],
        duration: json["duration"],
        fullTime: TimeMatch.fromJson(json["fullTime"]),
        halfTime: TimeMatch.fromJson(json["halfTime"]),
    );

    Map<String, dynamic> toJson() => {
        "winner": winner,
        "duration": duration,
        "fullTime": fullTime.toJson(),
        "halfTime": halfTime.toJson(),
    };
}

class TimeMatch {
    TimeMatch({
        required this.home,
        required this.away,
    });

    int home;
    int away;

    factory TimeMatch.fromJson(Map<String, dynamic> json) => TimeMatch(
        home: json["home"],
        away: json["away"],
    );

    Map<String, dynamic> toJson() => {
        "home": home,
        "away": away,
    };
}


class Referee { // arbitro
    Referee({
        required this.id,
        required this.name,
        required this.type,
        required this.nationality,
    });

    int id;
    String name;
    String type;
    String nationality;

    factory Referee.fromJson(Map<String, dynamic> json) => Referee(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        nationality: json["nationality"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "nationality": nationality,
    };
}

class Season {
    Season({
        required this.id,
        required this.startDate,
        required this.endDate,
        required this.currentMatchday,
        this.winner,
    });

    int id;
    DateTime startDate;
    DateTime endDate;
    int currentMatchday;
    dynamic winner;

    factory Season.fromJson(Map<String, dynamic> json) => Season(
        id: json["id"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        currentMatchday: json["currentMatchday"],
        winner: json["winner"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "startDate": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "endDate": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "currentMatchday": currentMatchday,
        "winner": winner,
    };
}
