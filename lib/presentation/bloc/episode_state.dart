part of 'episode_bloc.dart';

class EpisodeState {}

class EpisodeLoaded extends EpisodeState {
  final List<Episode> episodes;
  EpisodeLoaded({required this.episodes});
}

class EpisodeLoading extends EpisodeState {}

class EpisodeFailure extends EpisodeState {
  final Object? exceprtion;

  EpisodeFailure({required this.exceprtion});
}
