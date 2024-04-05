import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morti/data/repository/character_repo.dart';
import 'package:rick_and_morti/internal/app.dart';

void main() {
  CharacterRepo(dio: Dio()).getCharacter(1, 'c');
  runApp(const App());
}
