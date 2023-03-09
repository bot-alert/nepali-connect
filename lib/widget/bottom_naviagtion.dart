import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

class CostumeBottomNavigationBar extends StatelessWidget {
  final Function(int index)? onTap;
  final int currentIndex;
  const CostumeBottomNavigationBar(
      {super.key, this.onTap, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return CustomNavigationBar(
      iconSize: 30.0,
      selectedColor: Colors.black,
      strokeColor: Colors.black,
      unSelectedColor: Colors.grey,
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        CustomNavigationBarItem(
          icon: const Icon(
            Icons.chat_bubble_outline_outlined,
          ),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.notifications_none_outlined),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.person_outline_outlined),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.settings_outlined),
        ),
      ],
    );
  }
}