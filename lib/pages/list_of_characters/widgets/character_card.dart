import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:rick_and_morti/configs/AppFonts.dart';
import 'package:rick_and_morti/configs/palette.dart';
import 'package:rick_and_morti/models/character.dart';

class CharacterCard extends StatefulWidget {
  final Character character;
  const CharacterCard({super.key, required this.character});

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image(
            width: 74,
            height: 74,
            image: AssetImage(widget.character.image),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(18, 9, 0, 9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.character.status,
                style: AppFonts.s10w500.copyWith(
                  color: widget.character.isAlive
                      ? Palette.isAliveColor
                      : Palette.isDeathColor,
                  letterSpacing: 1.5,
                ),
              ),
              Text(
                widget.character.name,
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
    );
  }
}
