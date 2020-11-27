import 'package:flutter/material.dart';
import 'package:pokeapi/presentation/screens/screens.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MenuScreen(),
        '/search': (context) => PokemonSearch(),
        '/random': (context) => PokemonRandom(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
