import 'package:poke_api_test/data/datasource/pokemon_data_source.dart';
import 'package:poke_api_test/data/datasource/pokemon_remote_data_source.dart';
import '../../domain/pokemon.dart';
import '../../domain/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonDataSource dataSource = PokemonRemoteDataSource();
  
  @override
  Future<Pokemon> getPokemonByName(String name) {
    return dataSource.getPokemonByName(name);
  }
  
  @override
  Future<PokemonList> getPokemons() {
    return dataSource.getPokemons();
  }

  @override
  Future<PokemonList> getMorePokemons(String url) {
    return dataSource.getMorePokemons(url);
  }

 
}
