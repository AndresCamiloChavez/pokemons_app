import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemons_app/features/home/domain/entities/football.dart';
import 'package:pokemons_app/features/home/presentation/providers/matches_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchProvider = ref.watch(matchesProvider);
    return Scaffold(
        body: matchProvider.when(
            data: (data) {
              return RefreshIndicator(
                onRefresh: () async {
                  await ref.read(matchNotifierProvider.notifier).loadMatches();
                },
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final match = data[index];
                    return Column(
                      children: [_MatchWidget(match: match), const Divider()],
                    );
                  },
                ),
              );
            },
            error: (error, errorTrace) => const Text('Ocurrió un error'),
            loading: () => const Center(child: CircularProgressIndicator())));
  }
}

class _MatchWidget extends StatelessWidget {
  const _MatchWidget({
    required this.match,
  });

  final MatchFootball match;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              _TeamMatch(team: match.homeTeam),
            ],
          ),
          Row(
            children: [
              Text(match.score?.fullTime?.home.toString() ?? '-', style: TextStyle(fontSize:30, fontWeight:  FontWeight.w500)),
              SizedBox( width: 20,),
              Column(
                children:  [
                   Text('VS', style: GoogleFonts.permanentMarker( fontSize: 24, color: Colors.grey),),
                  //  Text(match.matchday.toString() ?? '', style: TextStyle(fontSize: 20),),
                ]
              ),
              SizedBox( width: 20,),
              Text(match.score?.fullTime?.away.toString() ?? '-', style: TextStyle(fontSize: 30,  fontWeight: FontWeight.w500)),
            ],
          ),
          Row(
            children: [
              _TeamMatch(team: match.awayTeam),
            ],
          ),
        ],
      ),
    );
  }
}

class _TeamMatch extends StatelessWidget {
  const _TeamMatch({
    super.key,
    this.team,
  });

  final Team? team;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _ImageLogoTeam(
            urlLogo: team?.crest,
          ),
          Text(
            team?.name ?? '',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ImageLogoTeam extends StatelessWidget {
  const _ImageLogoTeam({this.urlLogo});

  final String? urlLogo;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      urlLogo ?? '',
      width: 50,
      height: 50,
      errorBuilder: (context, error, stackTrace) {
        return Image.network(
          'https://www.gstatic.com/onebox/sports/logos/crest_48dp.png',
          width: 50,
          height: 50,
        );
      },
    );
  }
}
