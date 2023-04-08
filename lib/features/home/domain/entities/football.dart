// To parse this JSON data, do
//
//     final resultApi = resultApiFromJson(jsonString);

import 'dart:convert';

ResultApi resultApiFromJson(String str) => ResultApi.fromJson(json.decode(str));

String resultApiToJson(ResultApi data) => json.encode(data.toJson());

class ResultApi {
    ResultApi({
        this.filters,
        this.resultSet,
        this.matches,
    });

    Filters? filters;
    ResultSet? resultSet;
    List<MatchFootball>? matches;

    factory ResultApi.fromJson(Map<String, dynamic> json) => ResultApi(
        filters: json["filters"] == null ? null : Filters.fromJson(json["filters"]),
        resultSet: json["resultSet"] == null ? null : ResultSet.fromJson(json["resultSet"]),
        matches: json["matches"] == null ? [] : List<MatchFootball>.from(json["matches"]!.map((x) => MatchFootball.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "filters": filters?.toJson(),
        "resultSet": resultSet?.toJson(),
        "matches": matches == null ? [] : List<dynamic>.from(matches!.map((x) => x.toJson())),
    };
}

class Filters {
    Filters({
        this.dateFrom,
        this.dateTo,
        this.permission,
    });

    DateTime? dateFrom;
    DateTime? dateTo;
    String? permission;

    factory Filters.fromJson(Map<String, dynamic> json) => Filters(
        dateFrom: json["dateFrom"] == null ? null : DateTime.parse(json["dateFrom"]),
        dateTo: json["dateTo"] == null ? null : DateTime.parse(json["dateTo"]),
        permission: json["permission"],
    );

    Map<String, dynamic> toJson() => {
        "dateFrom": "${dateFrom!.year.toString().padLeft(4, '0')}-${dateFrom!.month.toString().padLeft(2, '0')}-${dateFrom!.day.toString().padLeft(2, '0')}",
        "dateTo": "${dateTo!.year.toString().padLeft(4, '0')}-${dateTo!.month.toString().padLeft(2, '0')}-${dateTo!.day.toString().padLeft(2, '0')}",
        "permission": permission,
    };
}

class MatchFootball {
    MatchFootball({
        this.area,
        this.competition,
        this.season,
        this.id,
        this.utcDate,
        this.status,
        this.matchday,
        this.stage,
        this.group,
        this.lastUpdated,
        this.homeTeam,
        this.awayTeam,
        this.score,
        this.odds,
        this.referees,
    });

    Area? area;
    Competition? competition;
    Season? season;
    int? id;
    DateTime? utcDate;
    String? status;
    int? matchday;
    String? stage;
    String? group;
    DateTime? lastUpdated;
    Team? homeTeam;
    Team? awayTeam;
    Score? score;
    Odds? odds;
    List<Referee>? referees;

    factory MatchFootball.fromJson(Map<String, dynamic> json) => MatchFootball(
        area: json["area"] == null ? null : Area.fromJson(json["area"]),
        competition: json["competition"] == null ? null : Competition.fromJson(json["competition"]),
        season: json["season"] == null ? null : Season.fromJson(json["season"]),
        id: json["id"],
        utcDate: json["utcDate"] == null ? null : DateTime.parse(json["utcDate"]),
        status: json["status"]!,
        matchday: json["matchday"],
        stage: json["stage"]!,
        group: json["group"],
        lastUpdated: json["lastUpdated"] == null ? null : DateTime.parse(json["lastUpdated"]),
        homeTeam: json["homeTeam"] == null ? null : Team.fromJson(json["homeTeam"]),
        awayTeam: json["awayTeam"] == null ? null : Team.fromJson(json["awayTeam"]),
        score: json["score"] == null ? null : Score.fromJson(json["score"]),
        odds: json["odds"] == null ? null : Odds.fromJson(json["odds"]),
        referees: json["referees"] == null ? [] : List<Referee>.from(json["referees"]!.map((x) => Referee.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "area": area?.toJson(),
        "competition": competition?.toJson(),
        "season": season?.toJson(),
        "id": id,
        "utcDate": utcDate?.toIso8601String(),
        "status": status,
        "matchday": matchday,
        "stage": stage,
        "group": group,
        "lastUpdated": lastUpdated?.toIso8601String(),
        "homeTeam": homeTeam?.toJson(),
        "awayTeam": awayTeam?.toJson(),
        "score": score?.toJson(),
        "odds": odds?.toJson(),
        "referees": referees == null ? [] : List<dynamic>.from(referees!.map((x) => x.toJson())),
    };
}

class Area {
    Area({
        this.id,
        this.name,
        this.code,
        this.flag,
    });

    int? id;
    String? name;
    String? code;
    String? flag;

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
        this.id,
        this.name,
        this.shortName,
        this.tla,
        this.crest,
    });

    int? id;
    String? name;
    String? shortName;
    String? tla;
    String? crest;

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
        this.id,
        this.name,
        this.code,
        this.type,
        this.emblem,
    });

    int? id;
    String? name;
    String? code;
    String? type;
    String? emblem;

    factory Competition.fromJson(Map<String, dynamic> json) => Competition(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        type: json["type"]!,
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


class Odds {
    Odds({
        this.msg,
    });

    String? msg;

    factory Odds.fromJson(Map<String, dynamic> json) => Odds(
        msg: json["msg"]
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
    };
}

class Referee {
    Referee({
        this.id,
        this.name,
        this.type,
        this.nationality,
    });

    int? id;
    String? name;
    String? type;
    String? nationality;

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

class Score {
    Score({
        this.winner,
        this.duration,
        this.fullTime,
        this.halfTime,
    });

    String? winner;
    String? duration;
    Time? fullTime;
    Time? halfTime;

    factory Score.fromJson(Map<String, dynamic> json) => Score(
        winner: json["winner"],
        duration: json["duration"],
        fullTime: json["fullTime"] == null ? null : Time.fromJson(json["fullTime"]),
        halfTime: json["halfTime"] == null ? null : Time.fromJson(json["halfTime"]),
    );

    Map<String, dynamic> toJson() => {
        "winner": winner,
        "duration": duration,
        "fullTime": fullTime?.toJson(),
        "halfTime": halfTime?.toJson(),
    };
}

class Time {
    Time({
        this.home,
        this.away,
    });

    int? home;
    int? away;

    factory Time.fromJson(Map<String, dynamic> json) => Time(
        home: json["home"],
        away: json["away"],
    );

    Map<String, dynamic> toJson() => {
        "home": home,
        "away": away,
    };
}


class Season {
    Season({
        this.id,
        this.startDate,
        this.endDate,
        this.currentMatchday,
        this.winner,
    });

    int? id;
    DateTime? startDate;
    DateTime? endDate;
    int? currentMatchday;
    dynamic winner;

    factory Season.fromJson(Map<String, dynamic> json) => Season(
        id: json["id"],
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        currentMatchday: json["currentMatchday"],
        winner: json["winner"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "startDate": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "endDate": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "currentMatchday": currentMatchday,
        "winner": winner,
    };
}


class ResultSet {
    ResultSet({
        this.count,
        this.competitions,
        this.first,
        this.last,
        this.played,
    });

    int? count;
    String? competitions;
    DateTime? first;
    DateTime? last;
    int? played;

    factory ResultSet.fromJson(Map<String, dynamic> json) => ResultSet(
        count: json["count"],
        competitions: json["competitions"],
        first: json["first"] == null ? null : DateTime.parse(json["first"]),
        last: json["last"] == null ? null : DateTime.parse(json["last"]),
        played: json["played"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "competitions": competitions,
        "first": "${first!.year.toString().padLeft(4, '0')}-${first!.month.toString().padLeft(2, '0')}-${first!.day.toString().padLeft(2, '0')}",
        "last": "${last!.year.toString().padLeft(4, '0')}-${last!.month.toString().padLeft(2, '0')}-${last!.day.toString().padLeft(2, '0')}",
        "played": played,
    };
}
