import 'dart:async';

import 'package:fetch_stories/screens/characters/characters_screen.dart';
import 'package:fetch_stories/screens/home/home_screen.dart';
import 'package:fetch_stories/widgets/custom_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  final List<Widget> _pages = [HomeScreen(), CharactersScreen()];

  int? _selectedIndex;

  @override
  void initState() {
    super.initState();
    _getIndexFromPref();
  }

  Future<void> _saveIndexToPref() async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setInt("page", _selectedIndex ?? 0);
  }

  Future<void> _getIndexFromPref() async {
    final sharedPref = await SharedPreferences.getInstance();
    setState(() {
      _selectedIndex = sharedPref.getInt("page") ?? 0;
    });
  }

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    _saveIndexToPref();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _selectedIndex == null
          ? Scaffold(
              body: Center(
                  child: Text(
                "Tunggu Sebentary Ya😩",
                style: TextStyle(fontFamily: 'OpenSans'),
              )),
            )
          : Scaffold(
              extendBodyBehindAppBar: true,
              body: IndexedStack(
                index: _selectedIndex,
                children: _pages,
              ),
              bottomNavigationBar: CustomBottomAppBar(
                selectedIndex: _selectedIndex,
                onItemTap: _onTapped,
              ),
            ),
    );
  }
}
