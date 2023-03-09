import 'package:flutter/material.dart';
import 'package:pokedex/colors/colors.dart';

class AbilitiesPage extends StatefulWidget {
  const AbilitiesPage({super.key});

  @override
  State<AbilitiesPage> createState() => _AbilitiesPageState();
}

class _AbilitiesPageState extends State<AbilitiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Abilities"),  
        backgroundColor: grassColor,
      ) 
    );
  }
}