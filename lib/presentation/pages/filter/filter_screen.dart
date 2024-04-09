import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_and_morti/configs/AppFonts.dart';
import 'package:rick_and_morti/configs/palette.dart';
import 'package:rick_and_morti/data/models/enums.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({
    super.key,
  });

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  Status filterStatus = Status.empty;
  Gender filterGender = Gender.empty;
  bool isFilterActive = false;

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
            if (isFilterActive)
              GestureDetector(
                child: SvgPicture.asset('assets/image/Group.svg'),
                onTap: () => setState(() {
                  isFilterActive = false;
                  filterStatus = Status.empty;
                  filterGender = Gender.empty;
                }),
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
                      //  onTap: _changeSortAsc,
                      child: SvgPicture.asset(
                        'assets/image/sortMax.svg',
                        /*   color: widget.getIsFilter()
                            ? (isAscending
                                ? Palette.filterIcon
                                : Palette.smallText)
                            : Palette.smallText, */
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        right: 24,
                      ),
                    ),
                    GestureDetector(
                      // onTap: _changeSortDesc,
                      child: SvgPicture.asset(
                        'assets/image/sortMin.svg',
                        /*   color: widget.getIsFilter()
                            ? (isDesc ? Palette.filterIcon : Palette.smallText)
                            : Palette.smallText, */
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
            _buildCheckList(
                'СТАТУС', Status.alive, Status.dead, Status.unknown),
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
            _buildCheckList(
                'ПОЛ', Gender.female, Gender.male, Gender.genderless),
          ],
        ),
      ),
    );
  }

  _buildCheckList(String label, Enum option1, Enum option2, Enum option3) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Text(
            label,
            style: AppFonts.s10w500.copyWith(color: Palette.description),
          ),
        ),
        _buildFilterCheck(option1),
        _buildFilterCheck(option2),
        _buildFilterCheck(option3),
      ],
    );
  }

  _buildFilterCheck(Enum option) {
    return Row(
      children: [
        Checkbox(
          side: const BorderSide(color: Palette.description, width: 2),
          activeColor: Palette.filterIcon,
          value: _isActive(option),
          onChanged: (value) {
            print(value);
            if (value!) {
              setState(() {
                if (option is Status) {
                  filterStatus = option;
                } else if (option is Gender) {
                  filterGender = option;
                }
                isFilterActive = true;
              });
            } else {
              setState(() {
                if (option is Status) {
                  filterStatus = option;
                } else if (option is Gender) {
                  filterGender = option;
                }
              });
            }
          },
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          option.name,
          style: AppFonts.s16w400.copyWith(color: Colors.white),
        ),
      ],
    );
  }

  _isActive(Enum option) {
    if (option is Status) {
      return filterStatus == option;
    }
    if (option is Gender) {
      return filterGender == option;
    }
    return false;
  }

  /*  void _changeSortAsc() {
    setState(() {
      isAscending = !isAscending;
      if (isAscending) {
        widget.isFilter(true);
      } else {
        widget.isFilter(false);
      }
      isDesc = false;
    });
    widget.onChange(isAscending);
  }

  void _changeSortDesc() {
    setState(() {
      isDesc = !isDesc;
      if (isDesc) {
        widget.isFilter(true);
      } else {
        widget.isFilter(false);
      }
      isAscending = false;
    });
    widget.onChange(isAscending);
  } */
}
