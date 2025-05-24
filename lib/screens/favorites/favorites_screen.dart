import 'package:fetch_stories/core/hive/hive_box.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FavoritesScreen();
}

class _FavoritesScreen extends State<FavoritesScreen> {
  final data1 = HiveBoxes.favoriteBox.get('1');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: AppBar(
              backgroundColor: Colors.white,
              leadingWidth: 20,
              centerTitle: true,
              title: Text(
                "Favorite",
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 21,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: List.generate(10, (index) => Text("Hello ${index}")),
        ),
      ),
    );
  }
}
