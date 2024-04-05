part of 'character_bloc.dart';

class CharacterEvent {}

class CharacterFetch extends CharacterEvent {
  final String? name;
  final int? page;

  CharacterFetch({required this.name, required this.page});
}
