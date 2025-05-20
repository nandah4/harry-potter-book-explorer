import 'package:flutter/material.dart';

class HouseModel {
  final String house;
  final String emoji;
  final String founder;
  final List<String> colors;
  final String? animal;
  final int index;

  HouseModel(
      {required this.house,
      required this.emoji,
      required this.founder,
      required this.colors,
      this.animal,
      required this.index});

  factory HouseModel.fromJson(Map<String, dynamic> json) {
    return HouseModel(
        house: json['house'],
        emoji: json['emoji'],
        founder: json['founder'],
        colors: List<String>.from(json['colors'] ?? []),
        animal: json['animal'],
        index: json['index']);
  }
}
