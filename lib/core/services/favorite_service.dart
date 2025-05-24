import 'package:fetch_stories/core/hive/hive_box.dart';
import 'package:fetch_stories/data/models/favorite_model.dart';

class FavoriteService {
  late String itemId;
  Future<bool> addItems(FavoriteModel item) async {
    itemId = "${item.name}${item.id}";

    if (HiveBoxes.favoriteBox.containsKey(itemId)) {
      print("Item Sudah ada di box");
      return false;
    } else {
      await HiveBoxes.favoriteBox.put(itemId, item);
      print("Berhasil Menambahkan ke Box");
      return true;
    }
  }
}
