import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morti/configs/AppFonts.dart';
import 'package:rick_and_morti/configs/palette.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final List<Map> _statusList = [
    {'name': 'Живой', "isChecked": false},
    {'name': 'Мертвый', "isChecked": false},
    {'name': 'Неизвестно', "isChecked": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff152A3A),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Фильтры',
              style: AppFonts.s20w500.copyWith(
                color: Colors.white,
              ),
            ),
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
              'Сортировать',
              style: AppFonts.s10w500.copyWith(
                color: Palette.description,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Text(
                  'По алфавиту',
                  style: AppFonts.s16w400
                      .copyWith(color: Colors.white, letterSpacing: 0.15),
                ),
                //SvgPicture.asset(assetName)
              ],
            ),
            const SizedBox(
              height: 36,
            ),
            const Divider(
              color: Palette.description,
              height: 2,
            ),
            const SizedBox(
              height: 36,
            ),
            Text(
              'Статус',
              style: AppFonts.s10w500.copyWith(
                color: Palette.description,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 24),
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
}
