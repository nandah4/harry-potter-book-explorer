import 'package:hive_flutter/hive_flutter.dart';
import 'package:fetch_stories/data/models/favorite_model.dart';

class HiveBoxes {
  static late Box<FavoriteModel> favoriteBox;

  static Future<void> initFavoriteBox() async {
    favoriteBox = await Hive.openBox<FavoriteModel>('favoriteBox');
  }
}
