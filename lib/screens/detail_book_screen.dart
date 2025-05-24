import 'dart:ui';

import 'package:fetch_stories/core/hive/hive_box.dart';
import 'package:fetch_stories/core/services/favorite_service.dart';
import 'package:fetch_stories/core/utils/snackbar.dart';
import 'package:fetch_stories/data/models/book_model.dart';
import 'package:fetch_stories/data/models/favorite_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class DetailBookScreen extends StatelessWidget {
  DetailBookScreen({super.key, required this.book})
      : item = FavoriteModel(id: "${book.index}", name: "${book.title}");
  final BookModel book;
  final FavoriteModel item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      top: 55,
                      left: 15,
                      child: Row(
                        spacing: 10,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Icon(
                                Icons.arrow_back_outlined,
                                size: 24,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final added =
                                  await FavoriteService().addItems(item);

                              showFavoriteSnackbar(context, added, "added");
                            },
                            child: Container(
                              width: 45,
                              height: 45,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100)),
                              child: SvgPicture.asset(
                                "assets/icons/Heart.svg",
                                height: 25,
                                width: 25,
                              ),
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
    );
  }
}
