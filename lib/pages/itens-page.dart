import 'package:flutter/material.dart';
import 'package:pokedex/colors/colors.dart';

class ItensPage extends StatefulWidget {
  const ItensPage({super.key});

  @override
  State<ItensPage> createState() => _ItensPageState();
}

class _ItensPageState extends State<ItensPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Itens"),  
        backgroundColor: fightingColor,
      ) 
    );
  }
}