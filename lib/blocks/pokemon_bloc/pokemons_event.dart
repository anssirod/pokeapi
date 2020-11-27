part of 'pokemons_bloc.dart';

@immutable
abstract class PokemonsEvent {}

class PokemonSearchEvent extends PokemonsEvent {}

class PokemonRandomEvent extends PokemonsEvent {}
