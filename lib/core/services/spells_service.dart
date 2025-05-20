import 'dart:convert';

import 'package:fetch_stories/data/models/spell_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpellsService {
  Future<List<SpellModel>> fetchSpells() async {
    final url = "https://potterapi-fedeperin.vercel.app/en/spells";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> spells =  jsonDecode(response.body);

        return spells
            .map((el) => SpellModel.fromJson(el as Map<String, dynamic>))
            .toList();
      } else {
        return throw Exception("Fetch Failed");
      }
    } catch (e) {
      return throw Exception("Error Network $e");
    }
  }
}
