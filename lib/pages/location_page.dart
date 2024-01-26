import 'package:flutter/material.dart';
import 'package:pokedex/colors/colors.dart';

class LocationsPage extends StatefulWidget {
  const LocationsPage({super.key});

  @override
  State<LocationsPage> createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Locations"),
        backgroundColor: waterColor,  
      ) 
    );
  }
}