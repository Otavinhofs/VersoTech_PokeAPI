// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonStore on _PokemonStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_PokemonStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorAtom = Atom(name: '_PokemonStore.error', context: context);

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$pokemonAtom =
      Atom(name: '_PokemonStore.pokemon', context: context);

  @override
  Pokemon? get pokemon {
    _$pokemonAtom.reportRead();
    return super.pokemon;
  }

  @override
  set pokemon(Pokemon? value) {
    _$pokemonAtom.reportWrite(value, super.pokemon, () {
      super.pokemon = value;
    });
  }

  late final _$testeAtom = Atom(name: '_PokemonStore.teste', context: context);

  @override
  List<Pokemon>? get teste {
    _$testeAtom.reportRead();
    return super.teste;
  }

  @override
  set teste(List<Pokemon>? value) {
    _$testeAtom.reportWrite(value, super.teste, () {
      super.teste = value;
    });
  }

  late final _$pokemonsAtom =
      Atom(name: '_PokemonStore.pokemons', context: context);

  @override
  PokemonList? get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(PokemonList? value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  late final _$loadPokemonDetailsAsyncAction =
      AsyncAction('_PokemonStore.loadPokemonDetails', context: context);

  @override
  Future<void> loadPokemonDetails(String pokemonName) {
    return _$loadPokemonDetailsAsyncAction
        .run(() => super.loadPokemonDetails(pokemonName));
  }

  late final _$loadPokemonsAsyncAction =
      AsyncAction('_PokemonStore.loadPokemons', context: context);

  @override
  Future<void> loadPokemons() {
    return _$loadPokemonsAsyncAction.run(() => super.loadPokemons());
  }

  late final _$loadMorePokemonsAsyncAction =
      AsyncAction('_PokemonStore.loadMorePokemons', context: context);

  @override
  Future<void> loadMorePokemons(String url) {
    return _$loadMorePokemonsAsyncAction.run(() => super.loadMorePokemons(url));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
error: ${error},
pokemon: ${pokemon},
teste: ${teste},
pokemons: ${pokemons}
    ''';
  }
}
