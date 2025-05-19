import 'dart:ui';

import 'package:fetch_stories/core/services/spells_service.dart';
import 'package:fetch_stories/data/models/spell_model.dart';
import 'package:flutter/material.dart';

class SpellsTab extends StatelessWidget {
  final Future<List<SpellModel>> fetchSpells = SpellsService().fetchSpells();

  SpellsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: FutureBuilder(
              future: fetchSpells,
              builder: (context, snapshot) {
                final spells = snapshot.data;

                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: spells?.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 85,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Colors.grey.shade300))),
                          child: Row(
                            children: [
                              SizedBox(
                                  height: double.infinity,
                                  width: 50,
                                  child: Center(
                                    child: Text(
                                      "$index",
                                      style: TextStyle(
                                          fontFamily: 'OpenSans',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 6),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            maxLines: 2,
                                            "${spells?[index].spell}",
                                            style: TextStyle(
                                                fontFamily: 'OpenSans',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            maxLines: 2,
                                            "${spells?[index].use}",
                                            style: TextStyle(
                                                fontFamily: 'OpenSans',
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      )))
                            ],
                          ),
                        );
                      });
                } else {
                  return const Center(
                    child: Text(
                      "Spells Not Found",
                      style: TextStyle(fontFamily: 'OpenSans', fontSize: 16),
                    ),
                  );
                }
              })),
    );
  }
}
