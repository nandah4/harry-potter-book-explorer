
import 'package:fetch_stories/screens/detail_book_screen.dart';
import 'package:fetch_stories/widgets/recommended_card.dart';
import 'package:flutter/material.dart';
import 'package:fetch_stories/data/models/book_model.dart';
import 'package:fetch_stories/core/services/books_service.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  final Future<List<BookModel>> futureBook = BooksService().fetchBook();
  HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [Colors.black54, Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: AppBar(
                  titleSpacing: 0,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome Back,",
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                      Text("Potters",
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w500,
                              color: Colors.white))
                    ],
                  ),
                  actions: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(200)),
                      child: SvgPicture.asset(
                        "assets/icons/Heart.svg",
                        height: 25,
                        width: 25,
                      ),
                    )
                  ],
                  centerTitle: false,
                  backgroundColor: Colors.transparent,
                ),
              ))),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 450,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/bg-image.jpeg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          Colors.black,
                          Colors.black.withValues(alpha: 0)
                        ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter)),
                  ),
                  Positioned(
                      bottom: 35,
                      left: 20,
                      right: 20,
                      child: Column(
                        children: [
                          const Text(
                            "Harry Potter and the Sorcerer's Stone",
                            style: TextStyle(
                                fontFamily: 'OpenSans',
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "On his birthday, Harry Potter discovers that he is the son of two well-known wizards, from whom he has inherited magical powers.",
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Recommended For You",
                          style: TextStyle(
                              fontFamily: 'OpenSans',
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ))),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 220,
              child: FutureBuilder<List<BookModel>>(
                  future: widget.futureBook,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final books = snapshot.data;

                      return ListView.builder(
                          itemCount: books?.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final book = books?[index];

                            return Padding(
                                padding: EdgeInsets.only(
                                    left: index == 0 ? 20 : 0, right: 20),
                                child: GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailBookScreen(
                                                book: book!,
                                              ))),
                                  child: RecommendedCard(
                                    description: book?.description,
                                    title: book?.title,
                                    image: book?.cover,
                                  ),
                                ));
                          });
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                        ),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
