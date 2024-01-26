
import 'package:dio/dio.dart';
import 'package:pokedex/core/custom_http.dart';
import '../utils/endpoits.dart';

class ServicePokemon {
  final CustomHttp _http = CustomHttp();

  Future<dynamic> getPokemon(int numero) async {
  int lisPokemonGap = 0;
  int pokemonLenght = 10;

  if (numero != 1) {
    lisPokemonGap = numero * 10;
  }
    try {
      Response response = await _http.client.get(
          "${Endpoint.baseUrl}${Endpoint.pokemons}?limit=$pokemonLenght&offset=$lisPokemonGap");
      return response.data;
    } on DioError {
      return [];
    }
  }

  Future<dynamic> searchPokemon(String name) async {
    try {
      Response response = await _http.client
          .get("${Endpoint.baseUrl}${Endpoint.pokemons}/$name");
      return response.data;
    } on DioError {
      return [];
    }
  }
}
