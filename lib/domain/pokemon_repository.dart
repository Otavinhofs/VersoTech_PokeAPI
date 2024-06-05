import 'package:poke_api_test/domain/pokemon.dart';

abstract class PokemonRepository {
  Future<PokemonList> getPokemons();
  Future<Pokemon> getPokemonByName(String name);
  Future<PokemonList> getMorePokemons(String url);
}
