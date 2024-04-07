import 'package:flutter/material.dart';

import 'package:rick_and_morti/configs/AppFonts.dart';
import 'package:rick_and_morti/configs/palette.dart';
import 'package:rick_and_morti/data/models/character/results.dart';
import 'package:rick_and_morti/presentation/pages/character_description/character_description_screen.dart';

class CharacterCard extends StatefulWidget {
  final Results character;
  const CharacterCard({super.key, required this.character});

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CharacterDescriptionScreen(character: widget.character)));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image(
              width: 74,
              height: 74,
              image: NetworkImage(widget.character.image!),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(18, 9, 0, 9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.character.status!,
                  style: AppFonts.s10w500.copyWith(
                    color: widget.character.status! == 'Alive'
                        ? Palette.isAliveColor
                        : Palette.isDeathColor,
                    letterSpacing: 1.5,
                  ),
                ),
                Text(
                  widget.character.name!,
                  style: AppFonts.s16w500.copyWith(
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
                Text(
                  '${widget.character.species}, ${widget.character.gender}',
                  style: AppFonts.s12w400.copyWith(
                    color: Palette.smallText,
                    letterSpacing: 0.5,
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
