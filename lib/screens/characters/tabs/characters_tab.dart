import 'package:fetch_stories/core/services/characters_service.dart';
import 'package:fetch_stories/data/models/character_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CharactersTab extends StatelessWidget {
  final Future<List<CharacterModel>> futureCharacters =
      CharactersService().fetchCharacters();

  CharactersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
                child: FutureBuilder(
                    future: futureCharacters,
                    builder: (context, snapshot) {
                      final characters = snapshot.data;

                      if (snapshot.hasData) {
                        return ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: characters?.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () => print(index),
                                  child: CharacterItem(
                                      image: characters![index].image,
                                      birthdate: characters![index].birthdate,
                                      fullName: characters![index].fullName,
                                      interpretedPerson:
                                          characters![index].interpretedBy));
                            });
                      } else if (snapshot.hasError) {
                        return Text("Snapshot Error ${snapshot.error}");
                      } else {
                        return Center(
                            child: CircularProgressIndicator(
                          color: Colors.blue,
                        ));
                      }
                    }))
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
      this.interpretedPerson,
      this.image,
      this.birthdate});

  final String fullName;
  String? interpretedPerson;
  String? image;
  DateTime? birthdate;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 125,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: EdgeInsets.only(bottom: 10),
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
              child: Image.network(
                image!,
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
                fullName,
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
                    interpretedPerson ?? "",
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
                    DateFormat('MMM d, yyy').format(birthdate!),
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
