import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morti/data/repository/episode_repo.dart';
import 'package:rick_and_morti/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morti/data/repository/character_repo.dart';
import 'package:rick_and_morti/presentation/bloc/episode_bloc.dart';
import 'package:rick_and_morti/presentation/pages/character_catalog/list_of_characters_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CharacterBloc>(
          create: (context) =>
              CharacterBloc(characterRepo: CharacterRepo(dio: Dio())),
        ),
        BlocProvider<EpisodeBloc>(
          create: (context) =>
              EpisodeBloc(episodeRepo: EpisodeRepo(dio: Dio())),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Roboto',
          appBarTheme: const AppBarTheme(
            color: Color(0xff0B1E2D),
          ),
          scaffoldBackgroundColor: const Color(0xff0B1E2D),
        ),
        home: const ListOfCharactersScreen(),
      ),
    );
  }
}
