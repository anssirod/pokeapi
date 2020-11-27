import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokeapi/data/models/pokemon_model.dart';
import 'package:pokeapi/data/pokeapi.dart';

part 'pokemons_event.dart';
part 'pokemons_state.dart';

List pokemonNames;
Pokemon pokemonInfo;

class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
  PokemonsBloc() : super(PokemonsInitial());

  @override
  Stream<PokemonsState> mapEventToState(
    PokemonsEvent event,
  ) async* {
    if (event is PokemonSearchEvent) {
      yield PokemonsLoading();
      try {
        pokemonNames = await Pokeapi().getAllPokemonNames();
        yield PokemonsLoadedNames(pokemon: pokemonNames);
      } catch (e) {
        yield PokemonsError(error: e.toString());
      }
    }

    if (event is PokemonRandomEvent) {
      yield PokemonsLoading();
      try {
        pokemonInfo = await Pokeapi().getRandomPokemon();
        yield (PokemonsLoadedInfo(pokemon: pokemonInfo));
      } catch (e) {
        yield PokemonsError(error: e);
      }
    }
  }
}
