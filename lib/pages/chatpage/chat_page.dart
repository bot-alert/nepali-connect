import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nepali_connect/api.dart';
import 'package:nepali_connect/model/user.dart';
import 'package:nepali_connect/widget/chat_box.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<User> userList = [];
  void getUser() async {
    await dio.get(userUrl).then((value) {
      setState(() {
        userList =
            (value.data as List).map((user) => User.fromJson(user)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          appBar(context),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            if (index > 0) {
              return ChatBox(
                username: userList[index].username,
                active: userList[index].active,
                image: userList[index].image,
              );
            } else {
              return ChatBox(
                username: userList[index].username,
                active: userList[index].active,
                firstElement: true,
                image: userList[index].image,
              );
            }
          }, childCount: userList.length))
        ],
      ),
    );
  }

  SliverAppBar appBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      expandedHeight: 100,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                child: Row(
                  children: [
                    Expanded(flex: 10, child: searchBox()),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () => {},
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: Image.asset(
                            'assets/images/ak.jpg',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  CupertinoTextField searchBox() {
    return const CupertinoTextField(
      style: TextStyle(color: Colors.grey),
      keyboardType: TextInputType.text,
      placeholder: 'Search........',
      placeholderStyle: TextStyle(
        color: Color.fromARGB(255, 196, 198, 204),
        fontSize: 18.0,
      ),
      prefix: Padding(
        padding: EdgeInsets.all(8),
        child: Icon(
          Icons.search,
          size: 30.0,
          color: Color(0xffC4C6CC),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100.0)),
        color: Color(0xffF0F1F5),
      ),
    );
  }
}
