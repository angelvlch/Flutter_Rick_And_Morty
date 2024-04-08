import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:rick_and_morti/configs/AppFonts.dart';
import 'package:rick_and_morti/configs/palette.dart';
import 'package:rick_and_morti/data/models/episode/episode.dart';

class EpisodeTile extends StatelessWidget {
  const EpisodeTile({super.key, required this.series});
  final Episode series;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Серия ${series.id}',
          style: AppFonts.s10w500
              .copyWith(color: Palette.series, letterSpacing: 1.5),
        ),
        Text(
          '${series.name}',
          style: AppFonts.s16w500
              .copyWith(color: Colors.white, letterSpacing: 0.5),
        ),
        Text(
          '${series.airDate}',
          style: AppFonts.s14w400
              .copyWith(color: Palette.description, letterSpacing: 0.25),
        ),
      ],
    );
  }
}
