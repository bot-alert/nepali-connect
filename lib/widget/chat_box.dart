import 'package:flutter/material.dart';
import 'package:nepali_connect/pages/chatpage/conversation.dart';

class ChatBox extends StatefulWidget {
  final bool? firstElement;
  final String username;
  final bool? active;
  final String image;
  const ChatBox(
      {super.key,
      this.firstElement,
      required this.username,
      required this.active,required this.image});

  @override
  State<ChatBox> createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>  Conversation(image: widget.image,name: widget.username),
      )),
      child: Padding(
        padding: widget.firstElement == true
            ? const EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0)
            : const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          height: 80,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.network(
                              widget.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              color: widget.active == true
                                  ? Colors.green
                                  : Colors.grey,
                              shape: BoxShape.circle),
                        ),
                      ],
                    )),
              ),
              Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Text(widget.username,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w300)),
                      ),
                      SizedBox(
                        child: Text("Text message from ${widget.username}",
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w100)),
                      )
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        child: Text("12:43",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.w200)),
                      ),
                      widget.active == true
                          ? Container(
                              height: 20,
                              width: 20,
                              decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              child: const Center(
                                  child: Text(
                                "2",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              )),
                            )
                          : const SizedBox.shrink()
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
