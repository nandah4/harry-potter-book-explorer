import 'dart:async';
import 'package:fetch_stories/core/hive/hive_box.dart';
import 'package:fetch_stories/core/hive/hive_setup.dart';
import 'package:fetch_stories/screens/characters/characters_screen.dart';
import 'package:fetch_stories/screens/favorites/favorites_screen.dart';
import 'package:fetch_stories/screens/home/home_screen.dart';
import 'package:fetch_stories/widgets/custom_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessKey =
    GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter();
  registerAdapters(); // register custom model
  await HiveBoxes.initFavoriteBox(); // init boxes

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
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

  final List<Widget> _pages = [
    HomeScreen(),
    CharactersScreen(),
    FavoritesScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: scaffoldMessKey,
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
