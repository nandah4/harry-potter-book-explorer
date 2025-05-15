import 'package:fetch_stories/core/utils/datetime_parser.dart';
import 'package:flutter/material.dart';

class BookModel {
  final int number;
  final String title;
  final String originalTitle;
  final DateTime releaseDate;
  final String description;
  final int pages;
  final String cover;
  final int index;

  BookModel(
      {required this.number,
      required this.title,
      required this.originalTitle,
      required this.releaseDate,
      required this.description,
      required this.pages,
      required this.cover,
      required this.index});

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'number': int number,
        'title': String title,
        'originalTitle': String originalTitle,
        'releaseDate': String releaseDate,
        'description': String description,
        'pages': int pages,
        'cover': String cover,
        'index': int index
      } =>
        BookModel(
            number: number,
            title: title,
            originalTitle: originalTitle,
            releaseDate: DatetimeParser.dateFormater(releaseDate),
            description: description,
            pages: pages,
            cover: cover,
            index: index),
      _ => throw const FormatException('Failed to Load Books')
    };
  }
}
