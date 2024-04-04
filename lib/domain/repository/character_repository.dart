import 'package:rick_and_morti/data/models/character/character.dart';

abstract class CharacterRepository {
  Future<List<Character>> getCharacterModel();
}
