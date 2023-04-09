import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home/domain/entities/football.dart';

class MatchWidget extends StatelessWidget {
  const MatchWidget({
    super.key,
    required this.match,
  });

  final MatchFootball match;

  @override
  Widget build(BuildContext context) {
    return Row(
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
            Text(match.score?.fullTime?.home?.toString() ?? '-',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
            const SizedBox(
              width: 20,
            ),
            Column(children: [
              Text(
                'VS',
                style: GoogleFonts.permanentMarker(
                    fontSize: 24, color: Colors.grey),
              ),
              //  Text(match.matchday.toString() ?? '', style: TextStyle(fontSize: 20),),
            ]),
            const SizedBox(
              width: 20,
            ),
            Text(match.score?.fullTime?.away?.toString() ?? '-',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
          ],
        ),
        Row(
          children: [
            _TeamMatch(team: match.awayTeam),
          ],
        ),
      ],
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
