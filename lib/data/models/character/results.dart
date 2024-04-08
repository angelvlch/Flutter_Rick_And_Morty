import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morti/data/models/character/location.dart';
import 'package:rick_and_morti/data/models/character/origin.dart';

part 'results.g.dart';

@JsonSerializable()
class Results {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Location? location;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  Results({
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

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);
  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}
