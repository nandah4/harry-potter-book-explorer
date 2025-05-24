import 'package:hive_flutter/hive_flutter.dart';
import 'package:fetch_stories/data/models/favorite_model.dart';

void registerAdapters() {
  Hive.registerAdapter(FavoriteModelAdapter());
}
