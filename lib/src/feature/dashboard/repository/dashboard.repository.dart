import 'package:api_dio/src/feature/dashboard/models/pokemon.model.dart';
import 'package:dio/dio.dart';

class DashboardRepository {
  var dio = Dio();
  Future<List<PokemonModel>?> getPokemons() async {
    try {
      var response = await dio.get("https://pokeapi.co/api/v2/pokemon/");
      if (response.statusCode == 200) {
        final List<dynamic> body = await response.data["results"];
        return body.map((e) => PokemonModel.fromMap(e)).toList();
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
