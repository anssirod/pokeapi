import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapi/blocks/pokemon_bloc/pokemons_bloc.dart';

class PokemonRandom extends StatefulWidget {
  @override
  _PokemonRandomState createState() => _PokemonRandomState();
}

class _PokemonRandomState extends State<PokemonRandom> {
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocConsumer<PokemonsBloc, PokemonsState>(
                      builder: (context, state) {
                        if (state is PokemonsLoading) {
                          return const Center(
                              child: CircularProgressIndicator(
                            backgroundColor: Colors.black,
                          ));
                        }
                        if (state is PokemonsLoadedInfo) {
                          return Column(
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
                          );
                        } else {
                          return Column(
                            children: [
                              const Text(
                                  'Нажмите на кнопку, чтобы получить \n информацию о случайном покемоне'),
                              const SizedBox(height: 20.0),
                            ],
                          );
                        }
                      },
                      listener: (context, state) {
                        if (state is PokemonsError) {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(seconds: 1),
                              backgroundColor: Colors.blue,
                              content: Text(
                                'Error: ${PokemonsError().error.toString()}',
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: RaisedButton(
                color: Colors.blue,
                child:
                    const Text('Получить информацию \n о случайном покемоне'),
                onPressed: () => BlocProvider.of<PokemonsBloc>(context)
                    .add(PokemonRandomEvent())),
          ),
        ],
      ),
    );
  }
}
