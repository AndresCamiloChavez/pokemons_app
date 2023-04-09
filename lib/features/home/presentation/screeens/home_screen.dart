import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemons_app/features/home/presentation/providers/matches_provider.dart';

import '../../../widgets/custom_widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchProviderAsync = ref.watch(matchesProvider);
    final matches = ref.watch(matchNotifierProvider);
    return Scaffold(
        body: matchProviderAsync.when(
            data: (data) {
              return RefreshIndicator(
                onRefresh: () async {
                  await ref.refresh(matchesProvider.future).then((value) {});
                }
                ,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: matches.matches.length,
                  itemBuilder: (context, index) {
                    final match = data[index];
                    return Column(
                      children: [MatchWidget(match: match), const Divider()],
                    );
                  },
                ),
              );
            },
            error: (error, errorTrace) => const Text('Ocurrió un error'),
            loading: () => const Center(child: CircularProgressIndicator())));
  }
}
