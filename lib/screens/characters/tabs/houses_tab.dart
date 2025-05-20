import 'package:fetch_stories/core/services/house_service.dart';
import 'package:fetch_stories/data/models/house_model.dart';
import 'package:flutter/material.dart';

class HousesTab extends StatelessWidget {
  final Future<List<HouseModel>> fetchHouse = HouseService().fetchHouse();

  HousesTab({super.key});

  Color parseColor(String name) {
    switch (name.toLowerCase()) {
      case 'red':
        return Colors.red;
      case 'gold':
        return Colors.yellow.shade500;
      case 'yellow':
        return Colors.yellowAccent;
      case 'black':
        return Colors.black;
      case 'blue':
        return Colors.blue;
      case 'green':
        return Colors.green;
      case 'silver':
        return Colors.grey.shade400;
      default:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                  future: fetchHouse,
                  builder: (context, snapshot) {
                    final houses = snapshot.data;

                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: houses?.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: Colors.grey.shade200)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${houses?[index].emoji} ${houses?[index].house}",
                                    style: const TextStyle(
                                        fontFamily: 'OpenSans',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "House of ${houses?[index].founder} ",
                                    style: const TextStyle(
                                        fontFamily: 'OpenSans',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Animal can desribe is ${houses?[index].animal} ",
                                    style: const TextStyle(
                                        fontFamily: 'OpenSans',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    "Favourite Color",
                                    style: TextStyle(
                                        fontFamily: 'OpenSans',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: houses?[index]
                                            .colors
                                            .map((color) {
                                          return Container(
                                            margin: EdgeInsets.only(right: 10),
                                            width: 20,
                                            height: 10,
                                            color: parseColor(color),
                                          );
                                        }).toList() ??
                                        [],
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  }))
        ],
      ),
    );
  }
}
