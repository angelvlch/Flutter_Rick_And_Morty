import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morti/domain/models/character/info.dart';

import 'character.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel {
  Info? info;
  List<Character>? results;

  CharacterModel({this.info, this.results});
  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}
