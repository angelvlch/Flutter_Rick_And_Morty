import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morti/data/models/character/info.dart';

import 'results.dart';

part 'character.g.dart';

@JsonSerializable()
class Character {
  Info? info;
  List<Results>? results;

  Character({this.info, this.results});
  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterToJson(this);
  @override
  String toString() {
    // TODO: implement toString
    return '$info';
  }
}
