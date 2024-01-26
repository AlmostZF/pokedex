import 'package:flutter/material.dart';
import 'package:pokedex/colors/colors.dart';
import 'package:pokedex/controller/controller_search.dart';
import 'package:pokedex/models/model_poke_info.dart';

import 'package:pokedex/pages/poke_page.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({super.key});
  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  Controller controller = Controller();
  int contador = 0;
  List<PokemonData> listaBk = [];

  //Modal modal = Modal();

  _init(int clicked) async {
    controller.loading = true;
    await controller.getPokedex(contador);
    setState(() {
      controller.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.catching_pokemon_outlined),
        onPressed: () async {
          contador = contador + 1;
          setState(() {
            controller.loading = true;
          });
          await _init(contador);
        },
      ),
      appBar: AppBar(
        title: const Text("Pokedex"),
        backgroundColor: ghostColor,
      ),
      body: Container(
        color: const Color(0xFFebebeb),
        child: Stack(
          children: [
            GridView.custom(
                padding: const EdgeInsets.all(10.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // childAspectRatio: (2 / 1),
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                childrenDelegate: SliverChildListDelegate(
                  controller.list
                      .map(
                        (data) => GestureDetector(
                            onTap: () {
                              // controller.getPokemonPokedex("${data.name}");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PokePage(pokemon: data)));
                              // controller.a = data.name!;
                              // print(controller.a);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              child: SizedBox(
                                width: size.width * 0.5,
                                height: size.width * 0.5,
                                child: Card(
                                  color: controller.getColorForType(data.type[0]),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(padding: EdgeInsets.only(top: size.height*0.02)),
                                          SizedBox(
                                            width: size.width * 0.25,
                                            height: size.width * 0.1,
                                            child: Container(
                                              child: Center(
                                                  child: Text(controller.firstLetterUpperCase(data.name),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold),
                                              )),
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.15,
                                            height: size.width * 0.1,
                                            child: Center(
                                              child: Container(
                                                child: Text(
                                                    "# ${controller.customPokeNumber(data.id, 4)}", 
                                                    style: TextStyle(
                                                      color: Color.fromARGB(60, 0, 0, 0),
                                                      fontWeight: FontWeight.bold
                                                    )),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: size.width * 0.18,
                                            height: size.width * 0.21,
                                            child: Center(
                                              child: Container(
                                                width: size.width * 0.15,
                                                height: size.width * 0.06,
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(50, 255, 255, 255),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Center(
                                                    child:
                                                        Text(controller.firstLetterUpperCase(data.type[0]))
                                                        ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.23,
                                            height: size.width * 0.3,
                                            child: Container(
                                              child: Image.network(
                                                "${data.sprites}",
                                                loadingBuilder:
                                                    (context, child, progress) {
                                                  return progress == null
                                                      ? child
                                                      : const Center(
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: Colors.tealAccent,
                                                          ),
                                                        );
                                                },
                                                // image:
                                                //     NetworkImage("${data.sprites}")
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      // Text("# ${controller.customPokeNumber(data.id,4)}"),
                                      // // Text("${data.height} kg"),
                                      // Padding(padding: EdgeInsets.only(top: size.height*0.02, left: size.height*0.02)),
                                      // SizedBox(
                                      //   width: 87,
                                      //   height: 87,
                                      //   child: Image.network(
                                      //     "${data.sprites}",
                                      //     loadingBuilder: (context, child, progress) {
                                      //       return progress == null
                                      //       ? child
                                      //       : const Center(
                                      //         child: CircularProgressIndicator(
                                      //           color: Colors.tealAccent,
                                      //         ),
                                      //       );
                                      //     },
                                      //       // image:
                                      //       //     NetworkImage("${data.sprites}")
                                      //   ),

                                      // ),

                                      // const Padding(padding: EdgeInsets.only(top: 6)),
                                      // Text(controller
                                      //     .firstLetterUpperCase("${data.name}")),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                      )
                      .toList(),
                )),
            if (controller.loading)
              const Center(
                child: Card(
                  color: Color.fromRGBO(230, 227, 227,
                      0.5), // Defina a opacidade diretamente aqui
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
