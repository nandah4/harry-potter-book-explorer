import 'dart:convert';

import 'package:fetch_stories/data/models/book_model.dart';
import 'package:http/http.dart' as http;

class BooksService {
  Future<List<BookModel>> fetchBook() async {
    final response = await http
        .get(Uri.parse('https://potterapi-fedeperin.vercel.app/en/books'));

    if (response.statusCode == 200) {
      final List<dynamic> listData = jsonDecode(response.body);
      return listData
          .map((json) => BookModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception("Failed to load Book");
    }
  }
}
