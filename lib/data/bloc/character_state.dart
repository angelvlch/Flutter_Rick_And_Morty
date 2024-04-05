part of 'character_bloc.dart';

class CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final Character character;

  CharacterLoaded({required this.character});
}

class CharacterLoadingFailure extends CharacterState {
  final Object? exception;

  CharacterLoadingFailure({
    required this.exception,
  });
}
