
import 'package:flutter/material.dart';
import 'package:pokedex/pages/pokedex-page.dart';
import 'package:pokedex/service/services-pokemon.dart';
import 'package:pokedex/widgets/carousel.dart';
import 'package:pokedex/colors/colors.dart';
import 'package:pokedex/controller/controller-search.dart';

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
                      hintStyle: TextStyle(color: blackDefault, fontSize: 18),
                      prefixIcon: Container(
                        padding: EdgeInsets.all(15),
                        child: const Icon(
                          Icons.search_rounded,
                          color: blackDefault,
                        ),
                        width: 18,
                      )),
                  onSubmitted: (value) {
                    _init();
                    setState(() {});
                  },
                ),
              ),

              Container(
                height: 95,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        width: 200,
                        height: 25,
                        color: grassColor,
                        child: InkWell(
                          onTap: () {
                            print("clicou1");
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
                    SizedBox(width: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        width: 200,
                        height: 25,
                        color: fightingColor,
                        child: InkWell(
                          onTap: () {
                            print("clicou2");
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
                    SizedBox(width: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        width: 200,
                        height: 25,
                        color: waterColor,
                        child: InkWell(
                          onTap: () {
                            print("clicou3");
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
                    SizedBox(width: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        width: 200,
                        height: 25,
                        color: electricColor,
                        child: InkWell(
                          onTap: () {
                            print("clicou4");
                          },
                          child: Center(
                              child: Text("Movies",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * .05,
                                      color: whiteDefault))),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
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
                    SizedBox(width: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        width: 200,
                        height: 25,
                        color: darkColor,
                        child: InkWell(
                          onTap: () {
                            print("clicou6");
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
                    SizedBox(width: 12),
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
