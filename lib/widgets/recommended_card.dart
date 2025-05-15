import 'package:fetch_stories/data/models/book_model.dart';
import 'package:fetch_stories/core/services/books_service.dart';
import 'package:flutter/material.dart';
import 'package:fetch_stories/data/models/character_model.dart';

class RecommendedCard extends StatelessWidget {
  String? title;
  String? description;
  String? image;

  RecommendedCard({super.key, this.title, this.description, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 160,
        height: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Column(
            children: [
              SizedBox(
                height: 140,
                width: double.infinity,
                child: Image.network(
                  image!,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Text(
                  title!,
                  maxLines: 2,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                child: Text(
                  description!,
                  maxLines: 1,
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ));
  }
}
