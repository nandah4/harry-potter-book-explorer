import 'package:flutter/material.dart';

class SpellModel {
  final String? spell;
  final String? use;
  final int index;

  SpellModel({this.spell, this.use, required this.index});

  factory SpellModel.fromJson(Map<String, dynamic> json) {
    return SpellModel(
        index: json['index'], spell: json['spell'], use: json['use']);
  }
}
