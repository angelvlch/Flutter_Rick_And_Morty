import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morti/data/models/episode/episode.dart';
import 'package:rick_and_morti/data/repository/episode_repo.dart';

part 'episode_event.dart';
part 'episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final EpisodeRepo episodeRepo;
  EpisodeBloc({required this.episodeRepo}) : super(EpisodeLoading()) {
    on<EposideFetch>(
      (event, emit) async {
        try {
          if (state is! EpisodeLoaded) {
            emit(EpisodeLoading());
          }
          String series = event.urls
              .map(
                (e) => e.substring(e.length - 1),
              )
              .join(',');
          List<Episode> episodes = await episodeRepo.getEpisodes(series);
          emit(EpisodeLoaded(episodes: episodes));
        } catch (e) {
          emit(EpisodeFailure(exceprtion: e));
        }
      },
    );
  }
}
