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
  Widget _buildNavIcon(
      {required int index, required String activeIcon, required String icon}) {
    final isSelected = widget.selectedIndex == index;
    final iconName = isSelected ? activeIcon : icon;
    return SvgPicture.asset("assets/icons/$iconName.svg",
        width: 25, height: 25);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildNavIcon(
                index: 0, activeIcon: "Home_active", icon: "Home"),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: _buildNavIcon(
                  index: 1, activeIcon: "Document_active", icon: "Document"),
              label: "Character"),
          BottomNavigationBarItem(
              icon: _buildNavIcon(
                  index: 2, activeIcon: "Heart_active", icon: "Heart"),
              label: "Favorite"),
          BottomNavigationBarItem(
              icon: _buildNavIcon(
                  index: 3, activeIcon: "User_active", icon: "User"),
              label: "Profile"),
        ],
        currentIndex: widget.selectedIndex ?? 0,
        selectedItemColor: Colors.lightBlue,
        onTap: widget.onItemTap);
  }
}
