import 'package:flutter/widgets.dart';
import 'package:rick_and_morti/data/models/character/character.dart';

abstract class AbstractCharacterRepo {
  Future<Character> getCharacter(int page, String name);
}
