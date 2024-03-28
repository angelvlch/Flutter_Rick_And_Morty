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
      isAlive: true,
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
        backgroundColor: Color(0xff0B1E2D),
        title: const SearchBarWidget(),
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
            isListView ? _buildListView() : _buildGridView(),
          ],
        ),
      ),
    );
  }

  Expanded _buildListView() {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => _buildDivider,
        itemCount: _characters.length,
        itemBuilder: (context, index) =>
            CharacterCard(character: _characters[index]),
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
        itemCount: _characters.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) =>
            CharacterGrid(character: _characters[index]),
      ),
    );
  }
}
