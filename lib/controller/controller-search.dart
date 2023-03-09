import 'package:flutter/cupertino.dart';
import 'package:pokedex/models/model-poke-info.dart';
import 'package:pokedex/service/services-pokemon.dart';


class Controller {
  //variables others files
  TextEditingController search = TextEditingController();
  ServicePokemon servicePokemon = ServicePokemon();
  //local variables
  VoidCallback? func;
  String? name;
  String? img;
  String? type;
  int? heigth;
  bool theme = true;
  bool? loading = true;
  List<dynamic> pokeList = [];
  List<dynamic> pokedex = [];
  List<PokemonData> list = [];

  Future<void> getName() async {
    await servicePokemon.searchPokemon(search.text).then((value) {
      name = value['name'];
      heigth = value['height'];
      type = value['types'][0]['type']['name'];
      img = value['sprites']['front_default'];
      pokeList.add(value);
      loading = false;
    }).catchError((e) => print(e));
  }

  Future<void> getPokemonPokedex(String nome) async {
    await servicePokemon.searchPokemon(nome).then((value) {
      name = value['name'];
      heigth = value['height'];
      type = value['types'][0]['type']['name'];
      img = value['sprites']['front_default'];
      print(name);
      print(heigth);
      print(type);
      print(img);
    }).catchError((e) => print(e));
  }

  Future<void> getPokedex() async {
    await servicePokemon.getPokemon().then((value) {
      for (var item in value['results']) {
        servicePokemon.searchPokemon(item['name']).then((result) {
          list.add(PokemonData(
              id: result['id'],
              name: result['name'],
              height: result['height'],
              sprites: result['sprites']['other']['official-artwork']['front_default']));
              Pokemon pokemon = Pokemon(cartDetails: list);
              String pokemonStr = pokemonToJson(pokemon);
              print('${pokemonStr}');
              // final pokemon1 = pokemonFromJson(item);
              // print(pokemon1);
              loading = false;
              
        }).catchError((e) => print(e));
      }
    }).catchError((e) => print(e));
    func?.call();
  }
}
