import 'package:flutter/material.dart';
import 'package:pokedex/controller/controller_search.dart';
import 'package:pokedex/models/model_poke_info.dart';
class PokePage extends StatelessWidget {
  
 final PokemonData pokemon;

 const PokePage({required this.pokemon, super.key});


  @override
  Widget build(BuildContext context) {
    Controller controller = Controller();
    return Scaffold(
      backgroundColor: controller.getColorForType(pokemon.type[0]),
      appBar: AppBar(
        backgroundColor: controller.getColorForType(pokemon.type[0]),
      ),
      body: Column(
        children: [
          Center(
            child: Center(
              child: Container(
                color: Colors.transparent,
                height: 300,
                width: 300,
                child: Image(image: NetworkImage("${pokemon.sprites}")),
              ),
            ),
          ),
          const SizedBox(
            height: 320,
            width: 500,
            child: Card(
              shadowColor: Color.fromARGB(255, 0, 0, 0),
              color: Colors.white,

            ),
          )
        ],
      ),
    );
  }
}
