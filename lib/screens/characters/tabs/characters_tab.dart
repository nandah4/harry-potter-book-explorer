import 'package:flutter/material.dart';

class CharactersTab extends StatelessWidget {
  CharactersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CharacterItem(
                fullName: "Harry Potter", interpretedPerson: "Harry Potter")
          ],
        ),
      ),
    );
  }
}

class CharacterItem extends StatelessWidget {
  CharacterItem(
      {super.key,
      required this.fullName,
      required this.interpretedPerson,
      this.image,
      this.birthdate});

  final String fullName;
  final String interpretedPerson;
  String? image;
  String? birthdate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 125,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 1,
        )
      ], color: Colors.white, borderRadius: BorderRadius.circular(14)),
      child: Row(
        children: [
          SizedBox(
            height: 95,
            width: 95,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/bg-image.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Harry James Potter Abraham Lincoln",
                maxLines: 2,
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 18,
                    color: Colors.lightBlue,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Daniel Radcliffe",
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87),
                  ),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Icon(
                    Icons.date_range_outlined,
                    size: 18,
                    color: Colors.lightBlue,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Jul 31, 1980",
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87),
                  ),
                ],
              ),
            ],
          ))
        ],
      ),
    );
  }
}
