import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morti/models/character.dart';

class CharacterDescriptionScreen extends StatelessWidget {
  final Character character;
  const CharacterDescriptionScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                color: Colors.black
                    .withOpacity(0.5), // Уровень затемнения (от 0.0 до 1.0)
              ),
              Image.network(
                'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
              ),
              /*   BackdropFilter(
                filter:
                    ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Уровень размытия
                child: Container(
                  color: Colors
                      .transparent, // Чтобы размытие не затрагивало цвет фона
                ),
              ), */
            ],
          )
        ],
      ),
    );
  }
}
