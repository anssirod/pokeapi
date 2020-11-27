import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeapi/blocks/pokemon_bloc/pokemons_bloc.dart';
import 'package:pokeapi/data/models/pokemon_model.dart';

class PokemonSearch extends StatefulWidget {
  @override
  _PokemonSearchState createState() => _PokemonSearchState();
}

class _PokemonSearchState extends State<PokemonSearch> {
  final textFieldController = TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<Pokemon>> key = GlobalKey();

  @override
  void initState() {
    _getAllPokemonNames();
    super.initState();
  }

  void _getAllPokemonNames() {
    BlocProvider.of<PokemonsBloc>(context).add(PokemonSearchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Поиск покемона'),
      ),
      body: Column(
        children: [
          BlocConsumer<PokemonsBloc, PokemonsState>(builder: (context, state) {
            if (state is PokemonsLoadedNames) {
              return Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: AutoCompleteTextField<Pokemon>(
                  key: key,
                  clearOnSubmit: false,
                  controller: textFieldController,
                  suggestions: pokemonNames,
                  style: const TextStyle(color: Colors.black, fontSize: 20.0),
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
                    hintText: 'Введите имя покемона',
                    hintStyle:
                        const TextStyle(color: Colors.black, fontSize: 20.0),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                  itemFilter: (item, query) {
                    return item.name
                        .toLowerCase()
                        .startsWith(query.toLowerCase());
                  },
                  itemSorter: (a, b) {
                    return a.name.compareTo(b.name);
                  },
                  itemSubmitted: (item) {
                    textFieldController.text = item.name;
                  },
                  itemBuilder: (context, item) {
                    return Text(
                      item.name.toString(),
                      style:
                          const TextStyle(color: Colors.black, fontSize: 20.0),
                    );
                  },
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }, listener: (context, state) {
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
          })
        ],
      ),
    );
  }
}
