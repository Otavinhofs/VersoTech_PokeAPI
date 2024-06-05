import 'package:flutter/material.dart';
import 'package:poke_api_test/presentation/pokemon_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PokemonListPage(),
    );
  }
}
