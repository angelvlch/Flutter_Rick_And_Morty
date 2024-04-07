import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morti/data/models/character/character.dart';
import 'package:rick_and_morti/data/repository/character_repo.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterRepo characterRepo;
  CharacterBloc({required this.characterRepo}) : super(CharacterLoading()) {
    on<CharacterFetch>((event, emit) async {
      try {
        if (state is! CharacterLoaded) {
          emit(CharacterLoading());
        }

        Character character =
            await characterRepo.getCharacter(event.page, event.name);
        emit(CharacterLoaded(character: character));
      } catch (e) {
        emit(CharacterLoadingFailure(exception: e));
      }
    });
  }
}
