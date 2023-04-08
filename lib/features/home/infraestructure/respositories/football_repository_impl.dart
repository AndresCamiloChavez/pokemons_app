import 'package:pokemons_app/features/home/domain/domain.dart';
import 'package:pokemons_app/features/home/infraestructure/datasources/football_datasource_impl.dart';

class FootballRepositoryImpl implements FootballRepository {
  final FootBallDataSource footballDataSource;

  FootballRepositoryImpl({FootBallDataSource? footballDataSource})
      : footballDataSource = footballDataSource ?? FootballDataSourceImpl();
  @override
  Future<List<MatchFootball>> getMatches() {
    return footballDataSource.getMatches();
  }
}
