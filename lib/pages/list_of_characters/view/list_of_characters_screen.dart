/* import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morti/configs/AppFonts.dart';
import 'package:rick_and_morti/configs/palette.dart';

import 'package:rick_and_morti/models/character/character.dart';
import 'package:rick_and_morti/pages/list_of_characters/widgets/widgets.dart';

class ListOfCharactersScreen extends StatefulWidget {
  const ListOfCharactersScreen({super.key});

  @override
  State<ListOfCharactersScreen> createState() => _ListOfCharactersScreenState();
}

class _ListOfCharactersScreenState extends State<ListOfCharactersScreen> {
  bool isListView = true;
  bool isFilter = false;
  final List<Character> _characters = [
    Character(
      name: 'Ф',
      status: 'МЁРТВЫЙ',
      species: 'Человек',
      gender: 'Мужской',
      image: 'assets/image/avatar.png',
      isAlive: true,
    ),
    Character(
      name: 'Б',
      status: 'ЖИВОЙ',
      species: 'Человек',
      gender: 'Мужской',
      image: 'assets/image/avatar.png',
      isAlive: true,
    ),
    Character(
      name: 'С',
      status: 'ЖИВОЙ',
      species: 'Человек',
      gender: 'Мужской',
      image: 'assets/image/avatar.png',
      isAlive: false,
    ),
    Character(
      name: 'И',
      status: 'ЖИВОЙ',
      species: 'Человек',
      gender: 'Мужской',
      image: 'assets/image/avatar.png',
      isAlive: true,
    ),
    Character(
      name: 'А',
      status: 'ЖИВОЙ',
      species: 'Человек',
      gender: 'Мужской',
      image: 'assets/image/avatar.png',
      isAlive: true,
    ),
    Character(
      name: 'А',
      status: 'ЖИВОЙ',
      species: 'Человек',
      gender: 'Мужской',
      image: 'assets/image/avatar.png',
      isAlive: true,
    ),
    Character(
      name: 'А',
      status: 'ЖИВОЙ',
      species: 'Человек',
      gender: 'Мужской',
      image: 'assets/image/avatar.png',
      isAlive: true,
    ),
    Character(
      name: 'А',
      status: 'ЖИВОЙ',
      species: 'Человек',
      gender: 'Мужской',
      image: 'assets/image/avatar.png',
      isAlive: true,
    ),
    Character(
      name: 'А',
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

  bool getIsFilter() => isFilter;

  @override
  void initState() {
    _foundCharacter = _characters;
    super.initState();
  }

  void _runSearch(String enteredKeyword) {
    List<Character> results = [];
    if (enteredKeyword.isEmpty) {
      results = _characters;
    } else {
      results = _characters
          .where((character) => character.name
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundCharacter = results;
    });
  }

  void _isAscList(bool value) {
    if (isFilter) {
      _foundCharacter.sort((a, b) => a.name.compareTo(b.name));
      setState(() {
        if (value) {
          _foundCharacter = _foundCharacter.reversed.toList();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0B1E2D),
        title: SearchBarWidget(
          onChange: (value) => _runSearch(value),
          isAsc: (value) => _isAscList(value),
          isFilter: (value) => setState(() {
            isFilter = value;
          }),
          getIsFilter: getIsFilter,
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
                    'Всего персонажей: ${_foundCharacter.length}',
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
                : Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 60, bottom: 28),
                          child:
                              Image.asset('assets/image/nothing_founded.png'),
                        ),
                        Text(
                          'Персонаж с таким именем\n не найден',
                          textAlign: TextAlign.center,
                          style: AppFonts.s16w400.copyWith(
                            color: Palette.smallText,
                            letterSpacing: 0.15,
                          ),
                        ),
                      ],
                    ),
                  ),
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
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 24,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) =>
            CharacterGrid(character: _foundCharacter[index]),
      ),
    );
  }
}
 */