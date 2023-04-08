import '../entities/football.dart';

abstract class FootBallDataSource{
  Future<List<MatchFootball>> getMatches();
}