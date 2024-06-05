// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonList _$PokemonListFromJson(Map<String, dynamic> json) => PokemonList(
      (json['results'] as List<dynamic>)
          .map((e) => Pokemon.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['next'] as String,
    );

Map<String, dynamic> _$PokemonListToJson(PokemonList instance) =>
    <String, dynamic>{
      'next': instance.next,
      'results': instance.results,
    };

Pokemon _$PokemonFromJson(Map<String, dynamic> json) => Pokemon(
      json['name'] as String,
      (json['types'] as List<dynamic>?)
          ?.map((e) => TypeData.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['weight'] as num?)?.toInt(),
      (json['height'] as num?)?.toInt(),
      (json['abilities'] as List<dynamic>?)
          ?.map((e) => AbilityData.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['stats'] as List<dynamic>?)
          ?.map((e) => StatData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'name': instance.name,
      'types': instance.types,
      'weight': instance.weight,
      'height': instance.height,
      'abilities': instance.abilities,
      'stats': instance.stats,
    };
