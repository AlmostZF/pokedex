
import 'package:flutter/material.dart';
import 'package:pokedex/controller/controller_search.dart';
import 'package:pokedex/pages/abilities_page.dart';
import 'package:pokedex/pages/pokedex_page.dart';
import 'package:pokedex/pages/type.dart';
import 'package:pokedex/colors/colors.dart';

import 'itens_page.dart';
import 'location_page.dart';
import 'move_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Controller controller = Controller();

  _init() async {
    await controller.getName();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // controller.theme
          //     ? Container(
          //         child: Image.asset(
          //           "assets/backgroundLight.png",
          //           fit: BoxFit.fill,
          //           width: double.infinity,
          //           height: double.infinity,
          //         ),
          //       )
          //     : Container(
          //         child: Image.asset(
          //           "assets/backgroundDark.png",
          //           fit: BoxFit.fill,
          //           width: double.infinity,
          //           height: double.infinity,
          //         ),
          //       ),
          Column(
            children: [
              // Padding(
              //   padding: EdgeInsets.only(top: size.height * .02),
              //   child: Switch(
              //       value: controller.theme,
              //       activeColor: blackDefault,
              //       onChanged: (bool value) {
              //         controller.theme = true;
              //         setState(() {
              //           controller.theme = value;
              //         });
              //       }),
              // ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.width * .2,
                    bottom: size.width * .05,
                    left: size.width * .03,
                    right: size.width * .03),
                child: Text(
                  "What Pokemon do you need?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: size.width * .07),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * .07, right: size.width * .07, bottom: size.width*0.1),
                child: TextField(
                  controller: controller.search,
                  cursorColor: whiteDefault,
                  decoration: InputDecoration(
                      fillColor: greyDefault,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      hintText: 'Search',
                      hintStyle: const TextStyle(color: blackDefault, fontSize: 18),
                      prefixIcon: Container(
                        padding: const EdgeInsets.all(15),
                        width: 18,
                        child: const Icon(
                          Icons.search_rounded,
                          color: blackDefault,
                        ),
                      )),
                  onSubmitted: (value) {
                    _init();
                    setState(() {});
                  },
                ),
              ),

              SizedBox(
                height: 95,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(width: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        width: 200,
                        height: 25,
                        color: grassColor,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AbilitiesPage()));
                          },
                          child: Center(
                              child: Text("Abilities",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * .05,
                                      color: whiteDefault))),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        width: 200,
                        height: 25,
                        color: fightingColor,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ItensPage()));
                          },
                          child: Center(
                              child: Text("Itens",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * .05,
                                      color: whiteDefault))),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        width: 200,
                        height: 25,
                        color: waterColor,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LocationsPage()));
                          },
                          child: Center(
                              child: Text("Locations",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * .05,
                                      color: whiteDefault))),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        width: 200,
                        height: 25,
                        color: electricColor,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MovesPage()));
                          },
                          child: Center(
                              child: Text("Moves",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * .05,
                                      color: whiteDefault))),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        width: 200,
                        height: 25,
                        color: ghostColor,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PokedexPage()));
                          },
                          child: Center(
                              child: Text("Pokedex",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * .05,
                                      color: whiteDefault))),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        width: 200,
                        height: 25,
                        color: darkColor,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const TypePage()));
                          },
                          child: Center(
                              child: Text("Types",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * .05,
                                      color: whiteDefault))),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
