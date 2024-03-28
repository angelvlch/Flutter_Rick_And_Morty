import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morti/configs/AppFonts.dart';
import 'package:rick_and_morti/configs/palette.dart';
import 'package:rick_and_morti/models/character.dart';

class CharacterGrid extends StatefulWidget {
  final Character character;
  const CharacterGrid({super.key, required this.character});

  @override
  State<CharacterGrid> createState() => _CharacterGridState();
}

class _CharacterGridState extends State<CharacterGrid> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 22,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image(
                image: AssetImage(widget.character.image),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 18),
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
          ],
        ));
  }
}
