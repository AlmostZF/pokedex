import 'package:flutter/material.dart';
import 'package:pokedex/colors/colors.dart';

class MovesPage extends StatefulWidget {
  const MovesPage({super.key});

  @override
  State<MovesPage> createState() => _MovesPageState();
}

class _MovesPageState extends State<MovesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Moves"),  
        backgroundColor: electricColor,
      ) 
    );
  }
}