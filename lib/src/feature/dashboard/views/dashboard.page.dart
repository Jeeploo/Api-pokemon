import 'package:api_dio/src/feature/dashboard/controller/dashborder.controller.dart';
import 'package:api_dio/src/feature/dashboard/views/widgets/pokemon.tile.widget.dart';
import 'package:api_dio/src/service/pokemon.state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DashboardController controller = GetIt.I<DashboardController>();

  @override
  void initState() {
    controller.initPokemon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Observer(
        builder: (context) {
          switch (controller.pokemonState) {
            case PokemonState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case PokemonState.failure:
              return const Center(
                child: Text("Deu errado man!!"),
              );

            default:
              return ListView(
                  children: controller.pokemons
                      .map((e) => PokemonTile(
                            name: e.name,
                            onTap: (() {}),
                          ))
                      .toList());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {}),
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
