import '../entities/football.dart';

abstract class FootballRepository{
  Future<List<MatchFootball>> getMatches();
}