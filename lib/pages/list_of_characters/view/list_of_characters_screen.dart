import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morti/configs/AppFonts.dart';
import 'package:rick_and_morti/configs/palette.dart';

import 'package:rick_and_morti/models/character.dart';
import 'package:rick_and_morti/pages/list_of_characters/widgets/widgets.dart';

class ListOfCharactersScreen extends StatefulWidget {
  const ListOfCharactersScreen({super.key});

  @override
  State<ListOfCharactersScreen> createState() => _ListOfCharactersScreenState();
}

class _ListOfCharactersScreenState extends State<ListOfCharactersScreen> {
  bool isListView = true;
  final List<Character> _characters = [
    Character(
      name: 'Рик Cанчез',
      status: 'МЁРТВЫЙ',
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
      isAlive: true,
    ),
  ];
  List<Character> _foundCharacter = [];
  Divider get _buildDivider {
    return const Divider(
      height: 24,
      color: Color(0xff0B1E2D),
    );
  }

  @override
  void initState() {
    _foundCharacter = _characters;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Character> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _characters;
    } else {
      results = _foundCharacter
          .where((character) => character.name
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    setState(() {
      _foundCharacter = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0B1E2D),
        title: SearchBarWidget(
          onChange: (value) => _runFilter(value),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Всего персонажей: ${_characters.length}',
                    style: AppFonts.s10w500.copyWith(
                      color: Palette.smallText,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: GestureDetector(
                      onTap: _changeView,
                      child: isListView
                          ? SvgPicture.asset('assets/icons/sort1.svg')
                          : SvgPicture.asset('assets/icons/gridIcon.svg'),
                    ),
                  ),
                ],
              ),
            ),
            _foundCharacter.isNotEmpty
                ? (isListView ? _buildListView() : _buildGridView())
                : Text("Empty"),
          ],
        ),
      ),
    );
  }

  Expanded _buildListView() {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => _buildDivider,
        itemCount: _foundCharacter.length,
        itemBuilder: (context, index) =>
            CharacterCard(character: _foundCharacter[index]),
      ),
    );
  }

  void _changeView() {
    setState(() {
      isListView = !isListView;
    });
  }

  Expanded _buildGridView() {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: _foundCharacter.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) =>
            CharacterGrid(character: _foundCharacter[index]),
      ),
    );
  }
}
