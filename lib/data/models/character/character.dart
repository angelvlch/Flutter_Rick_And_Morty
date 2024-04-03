import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morti/data/models/character/location.dart';
import 'package:rick_and_morti/data/models/character/origin.dart';

part 'character.g.dart';

@JsonSerializable()
class Character {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Location? location;
  String? image;
  List<dynamic>? episode;
  String? url;
  String? created;

  Character({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    this.episode,
    this.url,
    this.created,
  });

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}
