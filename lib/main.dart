import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morti/data/repository/abstract_character_repo.dart';
import 'package:rick_and_morti/data/repository/character_repo.dart';

import 'package:rick_and_morti/internal/app.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCharacterRepo>(//внедрение зависимостей
      () => CharacterRepo(dio: Dio()));
  runApp(
    const App(),
  );
}
