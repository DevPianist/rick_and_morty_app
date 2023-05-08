import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_app/di/dependencies.dart';
import 'package:rick_and_morty_app/l10n/l10n.dart';
import 'package:rick_and_morty_app/src/features/character_detail/character_detail.dart';
import 'package:rick_and_morty_app/src/features/character_list/character_list.dart';
import 'package:rick_and_morty_app/src/features/home/home.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = '/';

  static void navigate(BuildContext context) =>
      GoRouter.of(context).pushReplacementNamed(routeName);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeBloc(),
        ),
        BlocProvider(
          create: (_) => CharacterListBloc(
            characterRepository: context.dependencies.characterRepository,
          )..add(const LoadCharacters()),
        ),
        BlocProvider(
          create: (_) => CharacterDetailBloc(
            characterRepository: context.dependencies.characterRepository,
          ),
        ),
      ],
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final currentIndex = state.currentIndex;
          return Scaffold(
            body: IndexedStack(
              index: currentIndex,
              children: const [
                CharacterListView(),
                CharacterDetailView(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.people),
                  label: l10n.characterListBottomNavigation,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.person),
                  label: l10n.characterDetailBottomNavigation,
                ),
              ],
              currentIndex: currentIndex,
              onTap: (index) {
                context.read<HomeBloc>().add(ChangePage(index));
              },
            ),
          );
        },
      ),
    );
  }
}
