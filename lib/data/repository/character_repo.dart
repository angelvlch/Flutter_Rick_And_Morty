import 'package:rick_and_morti/data/models/character/character.dart';
import 'package:rick_and_morti/data/repository/abstract_character_repo.dart';
import 'package:dio/dio.dart';

class CharacterRepo implements AbstractCharacterRepo {
  final Dio dio;
  CharacterRepo({required this.dio});

  @override
  Future<Character> getCharacter(int? page, String? name) async {
    final response = await dio
        .get('https://rickandmortyapi.com/api/character?page=$page&name=$name');
    return Character.fromJson(response.data);
  }
}
