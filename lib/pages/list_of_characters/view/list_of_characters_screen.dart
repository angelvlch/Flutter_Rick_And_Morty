import 'package:flutter/material.dart';

import 'package:rick_and_morti/models/character.dart';
import 'package:rick_and_morti/pages/list_of_characters/widgets/widgets.dart';

class ListOfCharactersScreen extends StatefulWidget {
  const ListOfCharactersScreen({super.key});

  @override
  State<ListOfCharactersScreen> createState() => _ListOfCharactersScreenState();
}

class _ListOfCharactersScreenState extends State<ListOfCharactersScreen> {
  final _characters = [
    Character(
      name: 'Рик Cанчез',
      status: 'ЖИВОЙ',
      species: 'Человек',
      gender: 'Мужской',
      image: 'assets/image/avatar.png',
      isAlive: true,
    ),
    Character(
      name: 'Рик Cанчез',
      status: 'ЖИВОЙ',
      species: 'Человек',
      gender: 'Мужской',
      image: 'assets/image/avatar.png',
      isAlive: true,
    ),
    Character(
      name: 'Рик Cанчез',
      status: 'ЖИВОЙ',
      species: 'Человек',
      gender: 'Мужской',
      image: 'assets/image/avatar.png',
      isAlive: false,
    ),
    Character(
      name: 'Рик Cанчез',
      status: 'ЖИВОЙ',
      species: 'Человек',
      gender: 'Мужской',
      image: 'assets/image/avatar.png',
      isAlive: true,
    ),
    Character(
      name: 'Рик Cанчез',
      status: 'ЖИВОЙ',
      species: 'Человек',
      gender: 'Мужской',
      image: 'assets/image/avatar.png',
      isAlive: false,
    ),
    Character(
      name: 'Рик Cанчез',
      status: 'ЖИВОЙ',
      species: 'Человек',
      gender: 'Мужской',
      image: 'assets/image/avatar.png',
      isAlive: false,
    ),
    Character(
      name: 'Рик Cанчез',
      status: 'ЖИВОЙ',
      species: 'Человек',
      gender: 'Мужской',
      image: 'assets/image/avatar.png',
      isAlive: false,
    ),
    Character(
      name: 'Рик Cанчез',
      status: 'ЖИВОЙ',
      species: 'Человек',
      gender: 'Мужской',
      image: 'assets/image/avatar.png',
      isAlive: false,
    ),
  ];

  Divider get _buildDivider {
    return const Divider(
      height: 24,
      color: Color(0xff0B1E2D),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SearchBarWidget(),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => _buildDivider,
        itemCount: _characters.length,
        itemBuilder: (context, index) =>
            CharacterCard(character: _characters[index]),
      ),
    );
  }
}
