import 'package:fetch_stories/screens/characters/tabs/houses_tab.dart';
import 'package:fetch_stories/screens/characters/tabs/spells_tab.dart';
import 'package:fetch_stories/screens/characters/tabs/Characters_tab.dart';
import 'package:flutter/material.dart';

class CharactersScreen extends StatelessWidget {
  CharactersScreen({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: AppBar(
                backgroundColor: Colors.white,
                leadingWidth: 20,
                centerTitle: true,
                title: GestureDetector(
                  onDoubleTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Characters",
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 21,
                        fontWeight: FontWeight.w500),
                  ),
                )),
          )),
      body: DefaultTabController(
          length: 3,
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  SizedBox(
                      height: 45,
                      child: TabBar(
                          indicatorColor: Colors.lightBlue,
                          dividerHeight: 0.5,
                          dividerColor: Colors.grey,
                          labelColor: Colors.black,
                          labelPadding: EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                          labelStyle: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 15,
                          ),
                          tabs: [
                            Text("Characters"),
                            Text("Spells"),
                            Text("Houses"),
                          ])),
                  Expanded(
                      child: TabBarView(children: [
                    CharactersTab(),
                    SpellsTab(),
                    HousesTab(),
                  ]))
                ],
              ))),
    );
  }
}
