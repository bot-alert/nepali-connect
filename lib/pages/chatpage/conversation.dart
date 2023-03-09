import 'package:flutter/material.dart';
import 'package:nepali_connect/widget/message_type_box.dart';

class Conversation extends StatefulWidget {
  final String image;
  final String name;
  const Conversation({super.key, required this.name, required this.image});

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  int messageSize = 0;
  List<String> person1 = ["hi", "hello"];
  List<String> person2 = ["yo man", "all good?"];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 12,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.network(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(widget.name)
          ],
        ),
        actionsIconTheme: const IconThemeData(
          size: 30,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.video_call))
        ],
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(children: [
          Container(),
          Container(
            margin: const EdgeInsets.only(bottom: 80),
            child: ListView.builder(
              shrinkWrap: true,
              reverse: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ChatText(
                        person1: person1,
                        image: Image.network(
                          widget.image,
                          fit: BoxFit.cover,
                        ),
                        isUser: false,
                        index: index),
                    ChatText(person1: person2, isUser: true, index: index),
                  ],
                );
              },
              itemCount: person1.length,
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            left: 8,
            child: MessageChatBox(
              controller: controller,
              iconTap: () {
                setState(() {
                  person1.insert(person1.length, controller.text);
                });
              },
            ),
          )
        ]),
      ),
    );
  }
}

class ChatText extends StatelessWidget {
  const ChatText(
      {super.key,
      required this.person1,
      this.image,
      required this.isUser,
      required this.index});

  final List<String> person1;
  final Image? image;
  final bool isUser;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 30,
            height: 30,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0), child: image),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(person1.reversed.elementAt(index),
                    style: const TextStyle(
                        color: Colors.white, overflow: TextOverflow.visible)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
