import 'package:flutter/material.dart';
import 'package:pokedex/colors/colors.dart';

class TypePage extends StatefulWidget {
  const TypePage({super.key});

  @override
  State<TypePage> createState() => _TypePageState();
}

class _TypePageState extends State<TypePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Type"),  
        backgroundColor: darkColor,
      ) 
    );
  }
}