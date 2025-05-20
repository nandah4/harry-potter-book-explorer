import 'dart:convert';

import 'package:fetch_stories/data/models/house_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HouseService {
  Future<List<HouseModel>> fetchHouse() async {
    final url = "https://potterapi-fedeperin.vercel.app/en/houses";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> houses = jsonDecode(response.body);

        return houses
            .map((each) => HouseModel.fromJson(each as Map<String, dynamic>))
            .toList();
      }
      return throw Exception("Failed to Fetch House");
    } catch (e) {
      return throw Exception("Error $e");
    }
  }
}
