import 'package:fetch_stories/core/hive/hive_box.dart';
import 'package:fetch_stories/core/services/favorite_service.dart';
import 'package:fetch_stories/core/utils/snackbar.dart';
import 'package:fetch_stories/main.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FavoritesScreen();
}

class _FavoritesScreen extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
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
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          Expanded(
              child: ValueListenableBuilder(
                  valueListenable: HiveBoxes.favoriteBox.listenable(),
                  builder: (context, box, _) {
                    final items = FavoriteService.getAll();

                    return items.isEmpty
                        ? const Center(
                            child: Text(
                              "Tidak ada Buku Favorit 🥺",
                              style: TextStyle(
                                  fontFamily: 'OpenSans', fontSize: 15),
                            ),
                          )
                        : ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              final item = items[index];
                              return Dismissible(
                                  key: Key("${item.id}_${item.name}"),
                                  direction: DismissDirection.endToStart,
                                  dismissThresholds: const {
                                    DismissDirection.endToStart: 0.3
                                  },
                                  background: Container(
                                    padding: EdgeInsets.only(right: 10),
                                    alignment: Alignment.centerRight,
                                    decoration:
                                        BoxDecoration(color: Colors.red),
                                    child: const Icon(
                                      Icons.delete,
                                      size: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onDismissed: (direction) async {
                                    final removed = await FavoriteService()
                                        .removeItems(item);

                                    showFavoriteSnackbar(
                                        scaffoldMessKey.currentState,
                                        removed,
                                        "removed");
                                  },
                                  child: Container(
                                      width: double.infinity,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 20),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color:
                                                      Colors.grey.shade300))),
                                      child: Text(
                                        "${index + 1} -  ${item.name}",
                                        style: TextStyle(
                                          fontFamily: 'OpenSans',
                                          fontSize: 14,
                                        ),
                                      )));
                            });
                  }))
        ]),
      ),
    );
  }
}
