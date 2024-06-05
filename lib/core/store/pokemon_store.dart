import 'package:mobx/mobx.dart';
import 'package:poke_api_test/data/respository/pokemon_repository_impl.dart';
import 'package:poke_api_test/domain/pokemon.dart';
import 'package:poke_api_test/domain/pokemon_repository.dart';
part 'pokemon_store.g.dart';

class PokemonStore = _PokemonStore with _$PokemonStore;

abstract class _PokemonStore with Store {
  final PokemonRepository _repository = PokemonRepositoryImpl();

  @observable
  bool isLoading = false;

  @observable
  String error = '';

  @observable
  Pokemon? pokemon;

    @observable
  List<Pokemon>? teste;

  @observable
  PokemonList? pokemons;

  @action
  Future<void> loadPokemonDetails(String pokemonName) async {
    try {
      isLoading = true;
      error = '';
      pokemon = await _repository.getPokemonByName(pokemonName);
    } catch (e) {
      error = 'Erro ao carregar o Pokémon: $e';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> loadPokemons() async {
    try {
      isLoading = true;
      error = '';
      pokemons = await _repository.getPokemons();
    } catch (e) {
      error = 'Erro ao carregar o Pokémon: $e';
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> loadMorePokemons(String url) async {
    try {
      isLoading = true;
      error = '';
      pokemons = await _repository.getMorePokemons(url);
      
    } catch (e) {
      error = 'Erro ao carregar o Pokémon: $e';
    } finally {
      isLoading = false;
    }
  }
}
