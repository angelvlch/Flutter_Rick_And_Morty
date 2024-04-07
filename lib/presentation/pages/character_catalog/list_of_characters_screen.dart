import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morti/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morti/data/repository/character_repo.dart';
import 'package:rick_and_morti/presentation/pages/character_catalog/search_page.dart';

class ListOfCharactersScreen extends StatefulWidget {
  const ListOfCharactersScreen({super.key});

  @override
  State<ListOfCharactersScreen> createState() => _ListOfCharactersScreenState();
}

class _ListOfCharactersScreenState extends State<ListOfCharactersScreen> {
  final repository = CharacterRepo(dio: Dio());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => CharacterBloc(characterRepo: repository),
        child: const SearchPage(),
      ),
    );
  }
}
