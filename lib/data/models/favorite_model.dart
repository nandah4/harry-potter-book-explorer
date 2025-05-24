import 'package:hive_flutter/hive_flutter.dart';

part 'favorite_model.g.dart';

@HiveType(typeId: 0)
class FavoriteModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;


  FavoriteModel({required this.id, required this.name});
}
