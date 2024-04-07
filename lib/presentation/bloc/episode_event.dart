part of 'episode_bloc.dart';

class EpisodeEvent {}

class EpisodeFetch extends EpisodeEvent {
  final List<String> urls;
  EpisodeFetch({required this.urls});
}
