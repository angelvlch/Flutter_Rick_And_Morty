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
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: 218,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(0, 0, 0, 0.65),
                          Color.fromRGBO(11, 30, 45, 0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                bottom: -90.0,
                child: CircleAvatar(
                  radius: 108,
                  backgroundColor: Color(0xff0B1E2D),
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(
                        'https://rickandmortyapi.com/api/character/avatar/1.jpeg'),
                  ),
                ),
              ),
              /* ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image(
                  width: 74,
                  height: 74,
                  image: NetworkImage(
                      'https://rickandmortyapi.com/api/character/avatar/1.jpeg',),
                ),
              ), */
            ],
          ),
        ],
      ),
    );
  }
}
