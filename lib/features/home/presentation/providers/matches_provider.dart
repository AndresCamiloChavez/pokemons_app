import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pokemons_app/features/home/domain/domain.dart';
import '../../infraestructure/infraestructure.dart';

final matchNotifierProvider = StateNotifierProvider<MatchesNotifier, MatchesState>((ref) {
  return MatchesNotifier();
});


final matchesProvider = FutureProvider<List<MatchFootball>>((ref) async {
  final FootballRepository footballRepository = FootballRepositoryImpl();
  final matches = await footballRepository.getMatches();
  ref.read(matchNotifierProvider.notifier).setMatches(matches);
  return matches;
});

class MatchesNotifier extends StateNotifier<MatchesState>{
  MatchesNotifier(): super(MatchesState()); // estado inicial
  setMatches(List<MatchFootball> matches) async {
    state = MatchesState(matches: matches);
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