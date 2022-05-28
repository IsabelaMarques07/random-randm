import 'package:checkpoint3/models/CharacterModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
class HomeController extends ChangeNotifier{
  String imageCharacterUrl = 'https://rickandmortyapi.com/api/character/avatar/1.jpeg';
  String nameCharacter = 'Ricky';
  String statusCharacter = 'Alive';
  String speciesCharacter = 'Human';
  String characterNumber = '1';
  bool isBodyTextChanged = false;

  changeBodyFunction(){
    isBodyTextChanged = !isBodyTextChanged;
    fetchCharacter();
    notifyListeners();
  }

fetchCharacter() async {
  var url = Uri.parse('https://rickandmortyapi.com/api/character/'+ Random().nextInt(300).toString());
  final response = await http.get(url);

  if (response.statusCode == 200) {
    CharacterModel character = CharacterModel.fromJson(json.decode(response.body));
    imageCharacterUrl = character.image!;
    nameCharacter = character.name!;
    statusCharacter = character.status!;
    speciesCharacter = character.species!;
  } else {
    throw Exception('Failed to load character');
  }
}
}