import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:poke_api_test/core/store/pokemon_store.dart';
import 'package:poke_api_test/data/respository/pokemon_repository_impl.dart';
import 'package:poke_api_test/domain/pokemon.dart';
import 'package:poke_api_test/domain/pokemon_repository.dart';
import 'package:poke_api_test/presentation/pokemon_details_page.dart';
import 'package:poke_api_test/presentation/pokemon_error_component.dart';
import 'package:poke_api_test/presentation/pokemon_loading_component.dart';

class PokemonListPage extends StatefulWidget {
  final Key? key;

  PokemonListPage({this.key}) : super(key: key);

  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  final PokemonRepository pokemonRepository = PokemonRepositoryImpl();
  final PokemonStore pokemonStore = PokemonStore();
  List<Pokemon> newList = [];
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _loadPokemons();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      final nextPageUrl = pokemonStore.pokemons?.next;
      if (nextPageUrl != null && nextPageUrl.isNotEmpty) {
        pokemonStore.loadMorePokemons(nextPageUrl).then((_) {
          final pokemons = pokemonStore.pokemons!.results;
          newList.addAll(pokemons);
        });
      }
    }
  }

  void _loadPokemons() async {
    await pokemonStore.loadPokemons();
    final pokemons = pokemonStore.pokemons?.results;
    if (pokemons != null) {
      newList.addAll(pokemons);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Center(
          child: SafeArea(
            child: Image.asset('lib/assets/pokemon_image.png'),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black12,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Observer(
          builder: (context) {
            if (pokemonStore.isLoading && pokemonStore.pokemons == null) {
              return const LoadingComponent();
            } else if (pokemonStore.error.isNotEmpty) {
              return const ErrorComponent();
            } else {
              return GridView.builder(
                controller: _scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                  childAspectRatio: 0.95,
                ),
                itemCount: newList.length,
                itemBuilder: (context, index) {
                  if (newList.isNotEmpty) {
                    final pokemon = newList[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PokemonDetailsPage(
                              pokemonName: pokemon.name,
                              index: index,
                            ),
                          ),
                        );
                      },
                      child: GridTile(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.black, Colors.grey],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Text(
                                pokemon.name.toUpperCase(),
                                style: const TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                              ),
                              Image.network(
                                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png",
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  }
                                  return Center(
                                    child: Container(
                                        height: 50,
                                        width: 50,
                                        color: Colors.transparent,
                                        child: const LoadingComponent()),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    return LoadingComponent();
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}
