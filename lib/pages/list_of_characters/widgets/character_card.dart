import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rick_and_morti/configs/palette.dart';
import 'package:rick_and_morti/models/character.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset(character.image),
          Container(
            // alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(18, 9, 0, 9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  character.status,
                  style: TextStyle(
                    color: character.isAlive
                        ? Palette.isAliveColor
                        : Palette.isDeathColor,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                  ),
                ),
                Text(
                  character.name,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '${character.species}, ${character.gender}',
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 12,
                    color: Palette.smallText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
