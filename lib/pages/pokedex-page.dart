import 'package:flutter/material.dart';
import 'package:pokedex/colors/colors.dart';
import 'package:pokedex/controller/controller-search.dart';
import 'package:pokedex/models/model-poke-info.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({super.key});
  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  Controller controller = Controller();
  //Modal modal = Modal();

  _init() async {
    await controller.getPokedex();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new_outlined),
        onPressed: () {
          _init();
          setState(() {});
        },
      ),
      appBar: AppBar(
        title: Text("Pokedex"),
        backgroundColor: ghostColor,
      ),
      body: GridView.custom(
          padding: EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // childAspectRatio: (2 / 1),
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          childrenDelegate: 
          SliverChildListDelegate(
            
            controller.list
                .map(
                  (data) => GestureDetector(
                      onTap: () {
                        controller.getPokemonPokedex("${data.name}");
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        child: Card(
                          color: grassColor,
                          child: Column(
                            children: [

                             Padding(padding: EdgeInsets.only(top: 6)),
                                   SizedBox(
                                     width: 87,
                                     height: 87,
                                     child: Image(
                                         image: NetworkImage(
                                             "${data.sprites}")),
                                   ),
                                   Text("Peso: ${data.height}"),
                                   Text("Nome: ${data.name}"),
                                   Text("Numero: ${data.id}")
                                  // : Center(
                                    //   child: Text(""),
                                    // ),
                              // Text(data.toString(),
                              //     style: TextStyle(
                              //         fontSize: 22, color: Colors.black),
                              //     textAlign: TextAlign.center)
                            ],
                          ),
                        ),
                      )),
                )
                .toList(),
          )),
    );
  }
}
