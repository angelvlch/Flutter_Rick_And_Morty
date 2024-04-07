import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morti/data/models/episode/episode.dart';

part 'episode_event.dart';
part 'episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  EpisodeBloc(super.initialState);
}
