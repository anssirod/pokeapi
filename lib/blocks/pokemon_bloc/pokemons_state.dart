part of 'pokemons_bloc.dart';

@immutable
abstract class PokemonsState {}

class PokemonsInitial extends PokemonsState {}

class PokemonsLoading extends PokemonsState {}

class PokemonsLoadedNames extends PokemonsState {
  final pokemon;
  PokemonsLoadedNames({this.pokemon});
}

class PokemonsLoadedInfo extends PokemonsState {
  final pokemon;
  PokemonsLoadedInfo({this.pokemon});
}

class PokemonsError extends PokemonsState {
  final error;
  PokemonsError({this.error});
}
