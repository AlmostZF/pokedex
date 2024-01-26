import 'dart:convert';

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

String pokemonToJson(Pokemon data) => json.encode(data.toJson());

class Pokemon {
  List<PokemonData>? cartDetails;

  Pokemon({
    this.cartDetails,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        cartDetails: json["PokemonDatas"] == null
            ? null
            : List<PokemonData>.from(
                json["PokemonDatas"].map((x) => PokemonData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "PokemonDatas": cartDetails == null
            ? null
            : List<dynamic>.from(cartDetails!.map((x) => x.toJson())),
      };
}

class PokemonData {
  int id;
  String name;
  int? height;
  String? sprites;
  dynamic type;

  PokemonData({
    this.id = 0,
    this.name = '',
    this.height,
    this.sprites,
    this.type,
  });

  @override
  String toString() {
    return 'PokemonData{name: $name,type: $type}';
  }

  factory PokemonData.fromJson(Map<String, dynamic> json) => PokemonData(
        id: json["id"],
        name: json["name"],
        height: json["height"],
        type: json["types"],
        sprites: json["sprites"]
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "height": height,
        "sprites": sprites,
        "type": type
      };
}
