
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:pokedex/colors/colors.dart';

import 'package:pokedex/models/model_poke_info.dart';
import 'package:pokedex/service/services_pokemon.dart';

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
  bool loading = false;
  List<dynamic> pokeList = [];
  List<dynamic> pokedex = [];
  List<PokemonData> list = [];
  List<PokemonData> list2 = [];
  // String? a;

  Future<void> getName() async {
    loading = true;
    await servicePokemon.searchPokemon(search.text).then((value) {
      name = value['name'];
      heigth = value['height'];
      type = value['types'][0]['type']['name'];
      img = value['sprites']['front_default'];
      pokeList.add(value);
      loading = false;
    }).catchError((e) => print(e));
    loading = false;
  }

  Future<void> getPokemonPokedex(String nome) async {
    loading = true;
    await servicePokemon.searchPokemon(nome).then((value) {
      name = value['name'];
      heigth = value['height'];
      type = value['types'][0]['type']['name'];
      img = value['sprites']['front_default'];
    }).catchError((e) {
      func?.call();
      loading = false;
      debugPrint(e);
    });
    loading = false;
    func?.call();
  }

  Future<void> getPokedex(int numero) async {
    List<String>? types;
    var value = await servicePokemon.getPokemon(numero);
    for (var item in value['results']) {
      try {
        var result = await servicePokemon.searchPokemon(item['name']);
       if (result['types'] != null) {
  types = (result['types'] as List<dynamic>)
      .map<String>((type) => type['type']['name'] as String)
      .toList();
}
        list.add(PokemonData(
          id: result['id'],
          name: result['name'],
          height: result['height'],
          type: types?.length == 1 ? [types![0]] : types,
          sprites: result['sprites']['other']['official-artwork']
              ['front_default'],
        ));
      } catch (e) {
        print(e);
      }
    }
    loading = false;
    list2 = list;
    print(list);
    // func?.call();
  }

  Color getColorForType(String type) {
    switch (type) {
      case 'grass':
        return grassColor;
      case 'normal':
        return normalColor;
      case 'fire':
        return fireColor;
      case 'water':
        return waterColor;
      case 'electric':
        return electricColor;
      case 'ice':
        return iceColor;
      case 'fighting':
        return fightingColor;
      case 'poison':
        return poisonColor;
      case 'ground':
        return groundColor;
      case 'flying':
        return flyingColor;
      case 'psychic':
        return psychicColor;
      case 'bug':
        return bugColor;
      case 'rock':
        return rockColor;
      case 'ghost':
        return ghostColor;
      case 'dark':
        return darkColor;
      case 'dragon':
        return darkColor;
      case 'steel':
        return steelColor;
      case 'fairy':
        return fairyColor;
      // break;
      default:
        return whiteDefault;
    }
  }

  String firstLetterUpperCase(String name) {
    return name[0].toUpperCase() + name.substring(1);
  }

  String customPokeNumber(int id, int length){
    return id.toString().padLeft(length, '0');
  }
}
