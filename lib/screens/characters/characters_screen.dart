import 'package:fetch_stories/screens/home/home_screen.dart';
import 'package:fetch_stories/screens/characters/tabs/Characters_tab.dart';
import 'package:flutter/material.dart';
import 'package:http/retry.dart';

class CharactersScreen extends StatelessWidget {
  CharactersScreen({super.key});

  @override
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
              centerTitle: false,
              leading: Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 22,
              ),
              title: Text(
                "Characters",
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 21,
                    fontWeight: FontWeight.w500),
              ),
            ),
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
                    Text("Characters"),
                    Text("Characters"),
                  ]))
                ],
              ))),
    );
  }
}
