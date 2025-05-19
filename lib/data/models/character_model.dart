import 'package:fetch_stories/core/utils/datetime_parser.dart';
import 'package:flutter/material.dart';

class CharacterModel {
  final String fullName;
  final String nickname;
  final String hogwartsHouse;
  final String interpretedBy;
  final List<String> children;
  final String image;
  final DateTime birthdate;
  final int index;

  CharacterModel(
      {required this.fullName,
      required this.nickname,
      required this.hogwartsHouse,
      required this.interpretedBy,
      required this.children,
      required this.image,
      required this.birthdate,
      required this.index});

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'fullName': String fullName,
        'nickname': String nickname,
        'hogwartsHouse': String hogwartsHouse,
        'interpretedBy': String interpretedBy,
        'children': List<dynamic> children,
        'image': String image,
        'birthdate': String birthdate,
        'index': int index
      } =>
        CharacterModel(
            fullName: fullName,
            nickname: nickname,
            hogwartsHouse: hogwartsHouse,
            interpretedBy: interpretedBy,
            children: children.cast<String>(),
            image: image,
            birthdate: DatetimeParser.dateFormater(birthdate),
            index: index),
      _ => throw Exception("Failed to load Characters")
    };
  }
}
