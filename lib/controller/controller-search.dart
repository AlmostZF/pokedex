import 'package:flutter/cupertino.dart';
import 'package:pokedex/service/services-pokemon.dart';

class Controller{
  //variables others files
 TextEditingController search = TextEditingController();
  ServicePokemon servicePokemon = ServicePokemon();
  //local variables
  String? name;
  String? img;
  String? type;
  int? heigth;
  bool theme = true;
  bool? loading = true ;
  List <dynamic> pokeList = [];


 Future<void> getName() async{
  await servicePokemon.searchPokemon(search.text).then((value) {
    name = value['name'];
    heigth = value['height'];
    type = value['types'][0]['type']['name'];
    img = value['sprites']['front_default'];
    pokeList.add(value);
    loading = false;
  }).catchError((e)=>print(e));
  
 }
}