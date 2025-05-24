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

  Future<bool> removeItems(FavoriteModel item) async {
    itemId = "${item.name}${item.id}";
    await HiveBoxes.favoriteBox.delete(itemId);
    return true;
  }

  static List<FavoriteModel> getAll() {
    return HiveBoxes.favoriteBox.values.toList();
  }
}
