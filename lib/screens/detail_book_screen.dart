import 'dart:ui';

import 'package:fetch_stories/core/hive/hive_box.dart';
import 'package:fetch_stories/core/services/favorite_service.dart';
import 'package:fetch_stories/data/models/book_model.dart';
import 'package:fetch_stories/data/models/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailBookScreen extends StatelessWidget {
  DetailBookScreen({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    final item = FavoriteModel(id: "${book.index}", name: "${book.title}");

    return MaterialApp(
        home: Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 350,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  SizedBox(
                    height: 270,
                    width: double.infinity,
                    child: ClipRRect(
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(book.cover),
                                fit: BoxFit.cover)),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                          child: Container(
                            color: Colors.transparent.withOpacity(0.2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Center(
                        child: SizedBox(
                          height: 250,
                          width: 180,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                              book.cover,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                      top: 50,
                      left: 15,
                      child: Row(
                        spacing: 15,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Icon(
                                Icons.arrow_back_outlined,
                                size: 25,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => FavoriteService().addItems(item),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100)),
                              child: Icon(Icons.add),
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    book.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                )),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "${DateFormat('MMM d, yyy').format(book.releaseDate)} |${book.pages} Pages",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                )),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                      style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      "${book.description}")),
            )
          ],
        ),
      ),
    ));
  }
}
