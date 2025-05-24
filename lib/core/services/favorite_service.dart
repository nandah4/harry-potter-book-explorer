import 'package:fetch_stories/core/hive/hive_box.dart';
import 'package:fetch_stories/data/models/favorite_model.dart';

class FavoriteService {
  void addItems(FavoriteModel item) async {
    await HiveBoxes.favoriteBox.put("${item.name}${item.id}", item);
    print("Berhasil Menambahkan ke Box");
  }
}
