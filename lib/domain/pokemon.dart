import 'package:json_annotation/json_annotation.dart';
import 'package:poke_api_test/domain/pokemon_detail.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class PokemonList {
  String? next;
  List<Pokemon> results;

  PokemonList(this.results, this.next);

  factory PokemonList.fromJson(Map<String, dynamic> json) =>
      _$PokemonListFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonListToJson(this);
}

@JsonSerializable()
class Pokemon {
  final String name;
  final List<TypeData>? types;
  final int? weight;
  final int? height;
  final List<AbilityData>? abilities;
  final List<StatData>? stats;

  Pokemon(this.name, this.types, this.weight, this.height, this.abilities,
      this.stats);

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  get results => null;

  Map<String, dynamic> toJson() => _$PokemonToJson(this);
}
