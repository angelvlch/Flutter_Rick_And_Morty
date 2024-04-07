part of 'episode_bloc.dart';

class EpisodeEvent {}

class EposideFetch extends EpisodeEvent {
  final List<String> urls;
  EposideFetch({required this.urls});
}
