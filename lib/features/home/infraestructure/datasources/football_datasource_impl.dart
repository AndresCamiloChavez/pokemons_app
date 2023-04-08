import 'package:pokemons_app/features/home/domain/datasources/football_datasource.dart';
import 'package:pokemons_app/features/home/domain/entities/football.dart';

import '../../../../config/config.dart';

class FootballDataSourceImpl implements FootBallDataSource{
    final dio = WebService.httpClient();
  @override
  Future<List<MatchFootball>> getMatches() async {
    try {
      // final response = await dio.get('/competitions/CL/matches');
      final response = await dio.get('/matches');
      final List<MatchFootball> matches = [];
      for (final macthResponse in response.data['matches']) {
        matches.add(MatchFootball.fromJson(macthResponse));
      }
      return matches;
    } catch (e) {
      print('LOG Ocurrió un error al consultar los maches ${ e }');
      return [];
    }
  }

}