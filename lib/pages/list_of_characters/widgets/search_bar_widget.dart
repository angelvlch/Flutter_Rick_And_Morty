import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morti/configs/AppFonts.dart';
import 'package:rick_and_morti/configs/palette.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: 'Найти персонажа',
      hintStyle: MaterialStateProperty.all(
        AppFonts.s16w400.copyWith(
          color: Palette.smallText,
          letterSpacing: 0.44,
        ),
      ),
      leading: Container(
        padding: const EdgeInsets.only(left: 7),
        child: SvgPicture.asset('assets/icons/Group.svg'),
      ),
      trailing: [
        SvgPicture.asset(
          'assets/icons/Line.svg',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: () {
              print("hee");
            },
            child: SvgPicture.asset('assets/icons/filter.svg'),
          ),
        )
      ],
      backgroundColor: MaterialStateProperty.all(Palette.searchBar),
    );
  }
}
