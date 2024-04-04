import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morti/configs/AppFonts.dart';
import 'package:rick_and_morti/configs/palette.dart';
import 'package:rick_and_morti/presentation/pages/filter/view/view.dart';

class SearchBarWidget extends StatefulWidget {
  final Function onChange;
  final Function isAsc;
  final Function isFilter;

  final Function getIsFilter;

  SearchBarWidget({
    super.key, // Исправлено: заменено super.key на Key? key
    required this.onChange,
    required this.isAsc,
    required this.isFilter,
    required this.getIsFilter,
  });
  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      textStyle: MaterialStatePropertyAll(
        AppFonts.s16w400.copyWith(
          color: Colors.white,
        ),
      ),
      onChanged: (value) {
        widget.onChange(value);
      },
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FilterScreen(
                    onChange: widget.isAsc,
                    isFilter: widget.isFilter,
                    getIsFilter: widget.getIsFilter,
                  ),
                ),
              );
            },
            child: SvgPicture.asset('assets/icons/filter.svg'),
          ),
        )
      ],
      backgroundColor: MaterialStateProperty.all(Palette.searchBar),
    );
  }
}
