import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morti/configs/AppFonts.dart';
import 'package:rick_and_morti/configs/palette.dart';

class FilterScreen extends StatefulWidget {
  final Function onChange;
  const FilterScreen({super.key, required this.onChange});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final List<Map> _statusList = [
    {'name': 'Живой', "isChecked": false},
    {'name': 'Мертвый', "isChecked": false},
    {'name': 'Неизвестно', "isChecked": false},
  ];
  bool isAscending = false;
  bool isDesc = false;
  bool isChoose = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff152A3A),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Фильтры',
              style: AppFonts.s20w500.copyWith(
                color: Colors.white,
              ),
            ),
            if (isChoose)
              GestureDetector(
                child: SvgPicture.asset('assets/image/Group.svg'),
              ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Сортировать'.toUpperCase(),
              style: AppFonts.s10w500.copyWith(
                color: Palette.description,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'По алфавиту',
                  style: AppFonts.s16w400
                      .copyWith(color: Colors.white, letterSpacing: 0.15),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: _changeSortAsc,
                      child: SvgPicture.asset(
                        'assets/image/sortMax.svg',
                        color: isChoose
                            ? (isAscending
                                ? Palette.filterIcon
                                : Palette.smallText)
                            : Palette.smallText,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        right: 24,
                      ),
                    ),
                    GestureDetector(
                      onTap: _changeSortDesc,
                      child: SvgPicture.asset(
                        'assets/image/sortMin.svg',
                        color: isChoose
                            ? (isDesc ? Palette.filterIcon : Palette.smallText)
                            : Palette.smallText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 36,
            ),
            const Divider(
              color: Palette.searchBar,
              height: 2,
            ),
            const SizedBox(
              height: 36,
            ),
            Text(
              'Статус'.toUpperCase(),
              style: AppFonts.s10w500.copyWith(
                color: Palette.description,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Column(
                children: _statusList.map((list) {
                  return CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    checkColor: Colors.black,
                    activeColor: Palette.filterIcon,
                    value: list['isChecked'],
                    title: Text(
                      list['name'],
                      style: AppFonts.s16w400.copyWith(color: Colors.white),
                    ),
                    onChanged: (bool? value) {},
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _changeSortAsc() {
    setState(() {
      isAscending = !isAscending;
      if (isAscending) {
        isChoose = true;
      } else {
        isChoose = false;
      }
      isDesc = false;
    });
    widget.onChange(isAscending);
  }

  void _changeSortDesc() {
    setState(() {
      isDesc = !isDesc;
      if (isDesc) {
        isChoose = true;
      } else {
        isChoose = false;
      }
      isAscending = false;
    });
    widget.onChange(isAscending);
  }
}
