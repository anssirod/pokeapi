import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapi/blocks/bloc/pokemons_bloc.dart';
import 'package:pokeapi/presentation/screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PokemonsBloc>(
      create: (context) => PokemonsBloc(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => MenuScreen(),
          '/search': (context) => PokemonSearch(),
          '/random': (context) => PokemonRandom(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
