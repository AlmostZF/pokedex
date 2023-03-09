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
  int? id;
  String? name;
  int? height;
  String? sprites;

  PokemonData({
    this.id,
    this.name,
    this.height,
    this.sprites,
  });

  factory PokemonData.fromJson(Map<String, dynamic> json) => PokemonData(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        height: json["height"] == null ? null : json["height"],
        sprites: json["sprites"] == null
            ? null
            : json["sprites"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "height": height == null ? null : height,
        "sprites": sprites == null ? null : sprites,
      };
}
