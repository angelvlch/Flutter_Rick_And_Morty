import 'package:flutter/material.dart';
import 'package:rick_and_morti/configs/AppFonts.dart';
import 'package:rick_and_morti/configs/palette.dart';
import 'package:rick_and_morti/models/character.dart';
import 'package:rick_and_morti/pages/character_description/view/view.dart';

class CharacterGrid extends StatefulWidget {
  final Character character;
  const CharacterGrid({super.key, required this.character});

  @override
  State<CharacterGrid> createState() => _CharacterGridState();
}

class _CharacterGridState extends State<CharacterGrid> {
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
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image(
                // height: 122,
                image: AssetImage(widget.character.image),
              ),
            ),
          ),
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
            style: AppFonts.s16w400.copyWith(
              letterSpacing: 0.1,
              color: Colors.white,
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
    );
  }
}
