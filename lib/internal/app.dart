import 'package:flutter/material.dart';
import '../presentation/pages/list_of_characters/list_of_characters.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          color: Color(0xff0B1E2D),
        ),
        scaffoldBackgroundColor: const Color(0xff0B1E2D),
      ),
      //  home: const ListOfCharactersScreen(),
    );
  }
}
