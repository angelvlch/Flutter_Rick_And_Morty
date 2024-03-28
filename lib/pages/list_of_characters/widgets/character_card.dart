import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rick_and_morti/configs/AppFonts.dart';
import 'package:rick_and_morti/configs/palette.dart';
import 'package:rick_and_morti/models/character.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(character.image),
        Container(
          padding: const EdgeInsets.fromLTRB(18, 9, 0, 9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                character.status,
                style: AppFonts.s10w500.copyWith(
                  color: character.isAlive
                      ? Palette.isAliveColor
                      : Palette.isDeathColor,
                  letterSpacing: 1.5,
                ),
              ),
              Text(
                character.name,
                style: AppFonts.s16w500.copyWith(
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                '${character.species}, ${character.gender}',
                style: AppFonts.s12w400.copyWith(
                  color: Palette.smallText,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
