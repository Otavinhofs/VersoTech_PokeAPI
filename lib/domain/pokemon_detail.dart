import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poke_api_test/domain/ability.dart';

part 'pokemon_detail.g.dart';

@JsonSerializable()
class PokemonDetail {
  PokemonDetail(this.name, this.baseExperience, this.types);

  String name;
  @JsonKey(name: 'base_experience')
  int baseExperience;
  List<TypeData> types;

  factory PokemonDetail.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDetailToJson(this);
}

@JsonSerializable()
class TypeData {
  TypeData(this.type);
  TypeDetail type;

  factory TypeData.fromJson(Map<String, dynamic> json) =>
      _$TypeDataFromJson(json);

  Map<String, dynamic> toJson() => _$TypeDataToJson(this);
}

@JsonSerializable()
class TypeDetail {
  TypeDetail(this.name);
  String name;

  factory TypeDetail.fromJson(Map<String, dynamic> json) =>
      _$TypeDetailFromJson(json);

  Map<String, dynamic> toJson() => _$TypeDetailToJson(this);
}

@JsonSerializable()
class AbilityData {
  AbilityData(this.ability);
  AbilityDetail ability;

  factory AbilityData.fromJson(Map<String, dynamic> json) =>
      _$AbilityDataFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityDataToJson(this);
}

@JsonSerializable()
class AbilityDetail {
  AbilityDetail(this.name);
  String name;

  factory AbilityDetail.fromJson(Map<String, dynamic> json) =>
      _$AbilityDetailFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityDetailToJson(this);
}

@JsonSerializable()
class StatData {
  StatData(this.stat, this.baseStat);
  @JsonKey(name: 'base_stat')
  int baseStat;
  StatDetail stat;

  factory StatData.fromJson(Map<String, dynamic> json) =>
      _$StatDataFromJson(json);

  Map<String, dynamic> toJson() => _$StatDataToJson(this);
}

@JsonSerializable()
class StatDetail {
  StatDetail(this.name);
  String name;

  factory StatDetail.fromJson(Map<String, dynamic> json) =>
      _$StatDetailFromJson(json);

  Map<String, dynamic> toJson() => _$StatDetailToJson(this);
}
