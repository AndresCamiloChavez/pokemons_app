import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pokemons_app/features/home/domain/domain.dart';
import '../../infraestructure/infraestructure.dart';

final matchNotifierProvider = StateNotifierProvider<MatchesNotifier, MatchesState>((ref) {
  final FootballRepository footballRepository = FootballRepositoryImpl();
  return MatchesNotifier(footballRepository);
});


final matchesProvider = FutureProvider<List<MatchFootball>>((ref) async {
  final FootballRepository footballRepository = FootballRepositoryImpl();

  final matches = await footballRepository.getMatches();
  return matches;
});


class MatchesNotifier extends StateNotifier<MatchesState>{

  final FootballRepository footballRepository;
  MatchesNotifier(this.footballRepository): super(MatchesState()); // estado inicial

  loadMatches() async {
    state = state.copyWith(isLoading: true);
    final matches = await footballRepository.getMatches();
    state = state.copyWith(isLoading: false, matches: [...matches]);
  }
}

class MatchesState{
  final bool isLoading;
  final List<MatchFootball> matches;

  MatchesState({this.isLoading = false, this.matches = const []});

  MatchesState copyWith({bool? isLoading, List<MatchFootball>? matches}){
    return MatchesState(isLoading: isLoading ?? this.isLoading, matches: matches ?? this.matches);
  }
}