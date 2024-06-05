// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetail _$PokemonDetailFromJson(Map<String, dynamic> json) =>
    PokemonDetail(
      json['name'] as String,
      (json['base_experience'] as num).toInt(),
      (json['types'] as List<dynamic>)
          .map((e) => TypeData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonDetailToJson(PokemonDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'base_experience': instance.baseExperience,
      'types': instance.types,
    };

TypeData _$TypeDataFromJson(Map<String, dynamic> json) => TypeData(
      TypeDetail.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TypeDataToJson(TypeData instance) => <String, dynamic>{
      'type': instance.type,
    };

TypeDetail _$TypeDetailFromJson(Map<String, dynamic> json) => TypeDetail(
      json['name'] as String,
    );

Map<String, dynamic> _$TypeDetailToJson(TypeDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

AbilityData _$AbilityDataFromJson(Map<String, dynamic> json) => AbilityData(
      AbilityDetail.fromJson(json['ability'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AbilityDataToJson(AbilityData instance) =>
    <String, dynamic>{
      'ability': instance.ability,
    };

AbilityDetail _$AbilityDetailFromJson(Map<String, dynamic> json) =>
    AbilityDetail(
      json['name'] as String,
    );

Map<String, dynamic> _$AbilityDetailToJson(AbilityDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

StatData _$StatDataFromJson(Map<String, dynamic> json) => StatData(
      StatDetail.fromJson(json['stat'] as Map<String, dynamic>),
      (json['base_stat'] as num).toInt(),
    );

Map<String, dynamic> _$StatDataToJson(StatData instance) => <String, dynamic>{
      'base_stat': instance.baseStat,
      'stat': instance.stat,
    };

StatDetail _$StatDetailFromJson(Map<String, dynamic> json) => StatDetail(
      json['name'] as String,
    );

Map<String, dynamic> _$StatDetailToJson(StatDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
