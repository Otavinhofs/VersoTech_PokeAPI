import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:poke_api_test/data/datasource/pokemon_data_source.dart';
import 'package:poke_api_test/domain/pokemon.dart';

class PokemonRemoteDataSource implements PokemonDataSource {
  @override
  Future<PokemonList> getPokemons() async {
    const apiUrl = 'https://pokeapi.co/api/v2/pokemon/';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      final list = PokemonList.fromJson(decodedData);
      return list;
    } else {
      throw Exception('Falha ao carregar os pokemons da API');
    }
  }

  @override
  Future<Pokemon> getPokemonByName(String name) async {
    final lowercaseName = name.toLowerCase();
    final apiUrl = 'https://pokeapi.co/api/v2/pokemon/$lowercaseName';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      final pokemon = Pokemon.fromJson(decodedData);
      return pokemon;
    } else {
      throw Exception('Failed to load Pokemon');
    }
  }
  
  @override
  Future<PokemonList> getMorePokemons(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      final list = PokemonList.fromJson(decodedData);
      return list;
    } else {
      throw Exception('Falha ao carregar os pokemons da API');
    }
  }
}
