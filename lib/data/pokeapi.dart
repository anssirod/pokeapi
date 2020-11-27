import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

import 'package:pokeapi/data/models/pokemon_model.dart';

class Pokeapi {
  Future<List> getAllPokemonNames() async {
    final _url = 'https://pokeapi.co/api/v2/pokemon/?limit=898';

    final _response = await http.get(Uri.encodeFull(_url));

    final _data = json.decode(_response.body);
    final pokemonInfo = _data['results'];
    final pokemonInfoFinal = pokemonInfo.cast<Map<String, dynamic>>();

    return pokemonInfoFinal
        .map<Pokemon>((json) => Pokemon.fromJson(json))
        .toList();
  }

  Future<Pokemon> getRandomPokemon() async {
    final pokemon = Pokemon();
    final _random = Random();
    final number = _random.nextInt(898);

    final _url = 'https://pokeapi.co/api/v2/pokemon/$number';

    final _response = await http.get(Uri.encodeFull(_url));

    final _data = json.decode(_response.body);
    pokemon.name = _data['name'];
    pokemon.id = _data['id'];
    pokemon.baseExperience = _data['base_experience'];
    pokemon.height = _data['height'];
    pokemon.weight = _data['weight'];
    return pokemon;
  }
}
