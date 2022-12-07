import 'package:api_dio/src/feature/dashboard/models/pokemon.model.dart';
import 'package:api_dio/src/feature/dashboard/repository/dashboard.repository.dart';
import 'package:api_dio/src/service/pokemon.state.dart';

import 'package:mobx/mobx.dart';
part 'dashborder.controller.g.dart';

class DashboardController = _DashboardControllerBase with _$DashboardController;

abstract class _DashboardControllerBase with Store {
  final DashboardRepository repository;

  _DashboardControllerBase({required this.repository});

  List<PokemonModel> pokemons = [];

  @observable
  PokemonState pokemonState = PokemonState.empty;

  @action
  Future<void> initPokemon() async {
    pokemonState = PokemonState.loading;
    var data = await repository.getPokemons();
    if (data != null) {
      pokemons.addAll(data);
      pokemonState = PokemonState.sucess;
    } else {
      pokemonState = PokemonState.failure;
    }
  }
}
