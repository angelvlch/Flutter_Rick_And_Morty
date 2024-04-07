import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rick_and_morti/configs/AppFonts.dart';
import 'package:rick_and_morti/configs/palette.dart';
import 'package:rick_and_morti/data/models/character/results.dart';

class CharacterDescriptionScreen extends StatelessWidget {
  final Results character;
  const CharacterDescriptionScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: 218,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(character.image!),
                      fit: BoxFit.cover,
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
                Positioned(
                  bottom: -100.0,
                  child: CircleAvatar(
                    radius: 108,
                    backgroundColor: const Color(0xff0B1E2D),
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(character.image!),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                character.name!,
                style: AppFonts.s34w400.copyWith(
                  letterSpacing: 0.25,
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                character.status!,
                style: (character.status == 'Alive')
                    ? AppFonts.s10w500.copyWith(
                        color: Palette.isAliveColor,
                        letterSpacing: 1.5,
                      )
                    : AppFonts.s10w500.copyWith(
                        color: Palette.isDeathColor,
                        letterSpacing: 1.5,
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 30, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Пол',
                              style: AppFonts.s12w400
                                  .copyWith(color: Palette.smallText)),
                          Text(
                            character.gender!,
                            style:
                                AppFonts.s14w400.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 118),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Расса',
                                style: AppFonts.s12w400
                                    .copyWith(color: Palette.smallText)),
                            Text(
                              character.species!,
                              style: AppFonts.s14w400
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Место рождения',
                          style: AppFonts.s12w400
                              .copyWith(color: Palette.smallText)),
                      Text(
                        character.origin!.name!,
                        style: AppFonts.s14w400.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 24),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Место рождения',
                          style: AppFonts.s12w400
                              .copyWith(color: Palette.smallText)),
                      Text(
                        character.location!.name!,
                        style: AppFonts.s14w400.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 33),
                  ),
                  const Divider(
                    height: 2,
                    color: Color(0xff152A3A),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                bottom: 24,
              ),
              child: Text(
                'Эпизоды',
                style: AppFonts.s20w500.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
