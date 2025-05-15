import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomAppBar extends StatefulWidget {
  final int? selectedIndex;
  final ValueChanged<int>? onItemTap;
  CustomBottomAppBar({super.key, this.onItemTap, required this.selectedIndex});

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBar();
}

class _CustomBottomAppBar extends State<CustomBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/icons/Home.svg",
                width: 25, height: 25),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/Document.svg",
                  width: 25, height: 25),
              label: "Character"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/Heart.svg",
                  width: 25, height: 25),
              label: "Favourite"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/User.svg",
                  width: 25, height: 25),
              label: "Profile"),
        ],
        currentIndex: widget.selectedIndex ?? 0,
        selectedItemColor: Colors.amber,
        onTap: widget.onItemTap);
  }
}
