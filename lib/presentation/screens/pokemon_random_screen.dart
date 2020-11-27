import 'package:flutter/material.dart';
import 'package:pokeapi/data/models/pokemon_model.dart';
import 'package:pokeapi/data/pokeapi.dart';

class PokemonRandom extends StatefulWidget {
  @override
  _PokemonRandomState createState() => _PokemonRandomState();
}

class _PokemonRandomState extends State<PokemonRandom> {
  bool loading = true;
  Pokemon pokemonInfo;
  final textStyle = const TextStyle(fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Случайный покемон'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(40.0),
                  ),
                ),
                height: 140.0,
                width: 300.0,
                child: Column(
                  children: [
                    loading
                        ? Column(
                            children: [
                              const Text('Нажмите на кнопку'),
                              const SizedBox(height: 20.0),
                              const CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              Text(
                                'Name: ${pokemonInfo.name}',
                                style: textStyle,
                              ),
                              Text(
                                'Id: ${pokemonInfo.id.toString()}',
                                style: textStyle,
                              ),
                              Text(
                                'Base experience ${pokemonInfo.baseExperience.toString()}',
                                style: textStyle,
                              ),
                              Text(
                                'Height: ${pokemonInfo.height.toString()}',
                                style: textStyle,
                              ),
                              Text(
                                'Weight: ${pokemonInfo.weight.toString()}',
                                style: textStyle,
                              )
                            ],
                          ),
                  ],
                ),
              ),
            ],
          ),
          RaisedButton(
            child: const Text('Получить информацию \n о случайном покемоне'),
            onPressed: () async {
              pokemonInfo = await Pokeapi().getRandomPokemon();
              setState(() {
                loading = false;
              });
            },
          ),
        ],
      ),
    );
  }
}
