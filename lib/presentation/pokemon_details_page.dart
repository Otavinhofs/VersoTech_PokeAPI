import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx/mobx.dart';
import 'package:poke_api_test/core/store/pokemon_store.dart';
import 'package:poke_api_test/domain/pokemon.dart';
import 'package:poke_api_test/domain/type_colors.dart';
import 'package:poke_api_test/data/respository/pokemon_repository_impl.dart';
import 'package:poke_api_test/domain/pokemon_repository.dart';
import 'package:getwidget/getwidget.dart';
import 'package:poke_api_test/presentation/assets_paths.dart';
import 'package:poke_api_test/presentation/pokemon_error_component.dart';
import 'package:poke_api_test/presentation/pokemon_loading_component.dart';

class PokemonDetailsPage extends StatelessWidget {
  final String pokemonName;
  final int index;
  final PokemonRepository pokemonRepository = PokemonRepositoryImpl();
  final PokemonStore pokemonStore = PokemonStore();

  PokemonDetailsPage({
    super.key,
    required this.pokemonName,
    required this.index,
  }) {
    pokemonStore.loadPokemonDetails(pokemonName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        leading: const BackButton(
     color: Color(0xFFFFFFFF),
     style: ButtonStyle(overlayColor: WidgetStateColor.transparent),
   ), 
        backgroundColor: Colors.black,
        title: Text(
          '#${index + 1} ${pokemonName.toUpperCase()}  ',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Observer(
        builder: (context) {
          if (pokemonStore.isLoading) {
            return Container(
                color: Colors.black, child: const LoadingComponent());
          } else if (pokemonStore.error.isNotEmpty) {
            return const ErrorComponent();
          } else {
            final pokemon = pokemonStore.pokemon!;
            return _buildPokemonDetails(pokemon);
          }
        },
      ),
    );
  }

  Widget _buildPokemonDetails(Pokemon pokemon) {
    List<Color> gradientColors = [
      TypeColors.typeColors[pokemon.types?.first.type.name] ?? Colors.grey,
      TypeColors.typeColors[pokemon.types?.last.type.name] ?? Colors.grey,
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                      colors: gradientColors,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Image.network(
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: _buildTypeWidgets(pokemon),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Weight: ${pokemon.weight}KG',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Height: ${pokemon.height! / 10}M',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Skills:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 125,
              child: GridView.count(
                controller: ScrollController(keepScrollOffset: false),
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 1,
                childAspectRatio: 3,
                children: _buildAbilityWidgets(pokemon),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Statistics:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: GridView.count(
                controller: ScrollController(keepScrollOffset: false),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 4,
                children: _buildStatWidgets(pokemon),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTypeWidgets(Pokemon pokemon) {
    if (pokemon.types!.isNotEmpty) {
      return pokemon.types!.map((type) {
        return Container(
          
          decoration: BoxDecoration(
            color: TypeColors.typeColors[type.type.name] ?? Colors.grey,
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Center(
            child: Text(
              type.type.name.toUpperCase(),
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        );
      }).toList();
    } else {
      return [
        const Text(
          'no type available',
          style: TextStyle(color: Colors.white),
        )
      ];
    }
  }

  List<Widget> _buildStatWidgets(Pokemon pokemon) {
    //como a api não tem retorno de maximo de stats pesquisei e vi que esse numero é o maximo de stat que um pokemon pode ter
    const int maxStatsValue = 255;
    return pokemon.stats!.map((stat) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              Text(
                '${stat.stat.name.toUpperCase().replaceAll('-', ' ')} ${stat.baseStat}',
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: GFProgressBar(
                  percentage: stat.baseStat / maxStatsValue,
                  backgroundColor: Colors.white,
                  progressBarColor: Colors.green,
                  width: 150,
                  lineHeight: 15,
                ),
              ),
            ],
          ),
        ],
      );
    }).toList();
  }

  List<Widget> _buildAbilityWidgets(Pokemon pokemon) {
    return pokemon.abilities!.map((ability) {
      return Card(
        child: Center(
          child: Text(
            ability.ability.name.toUpperCase(),
          ),
        ),
      );
    }).toList();
  }
}
