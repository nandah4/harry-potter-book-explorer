import 'dart:convert';

import 'package:fetch_stories/data/models/character_model.dart';
import 'package:http/http.dart' as http;

class CharactersService {
  Future<List<CharacterModel>> fetchCharacters() async {
    final url =
        Uri.parse("https://potterapi-fedeperin.vercel.app/en/characters");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> characters = jsonDecode(response.body);
        return characters
            .map(
                (data) => CharacterModel.fromJson(data as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception(
            "Failed to fetch characters. Status Code is ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error $e");
    }
  }
}
