import 'package:flutter/material.dart';
import 'package:nepali_connect/api.dart';
import 'package:nepali_connect/pages/chatpage/chat_page.dart';
import 'package:nepali_connect/pages/page2/page2.dart';
import 'package:nepali_connect/pages/page3/page3.dart';
import 'package:nepali_connect/pages/page4/page4.dart';
import 'package:nepali_connect/widget/bottom_naviagtion.dart';

class PageNavigator extends StatefulWidget {
  const PageNavigator({super.key});

  @override
  State<PageNavigator> createState() => _PageNavigatorState();
}

class _PageNavigatorState extends State<PageNavigator> {
  List<Widget> widgets = const [ChatPage(), Page2(), Page3(), Page4()];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CostumeBottomNavigationBar(
        currentIndex: index,
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
      ),
      body: widgets[index],
    );
  }
}
