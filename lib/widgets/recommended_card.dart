import 'package:flutter/material.dart';

class RecommendedCard extends StatelessWidget {
  final String? title;
  final String? description;
  final String? image;

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
