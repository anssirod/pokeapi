import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pokemons_event.dart';
part 'pokemons_state.dart';

class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
  PokemonsBloc() : super(PokemonsInitial());

  @override
  Stream<PokemonsState> mapEventToState(
    PokemonsEvent event,
  ) async* {
  }
}
