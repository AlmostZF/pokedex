import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/core/custom-http.dart';
import '../utils/endpoits.dart';

class ServicePokemon{
  CustomHttp _http = CustomHttp();
  Future<dynamic> getPokemon() async{
  try{
    Response response = await _http.client
    .get("${Endpoint.baseUrl}${Endpoint.pokemons}?limit=20&offset=0");
    return response.data;
  } on DioError catch (e) {
    return [];
  }
 }

  Future<dynamic> searchPokemon(String name) async{
  try{
    Response response = await _http.client
    .get("${Endpoint.baseUrl}${Endpoint.pokemons}/${name}");
    return response.data;
  } on DioError catch (e) {
    return [];
  }
 } 

}