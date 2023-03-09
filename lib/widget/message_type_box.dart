import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageChatBox extends StatelessWidget {
  final void Function()? iconTap;
  final TextEditingController? controller;

  const MessageChatBox({super.key, this.iconTap,this.controller});

  @override
  Widget build(BuildContext context) {
    return typeBox();
  }

  Padding typeBox() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: CupertinoTextField(
        controller: controller,
        maxLines: 4,
        minLines: 1,
        padding: EdgeInsets.all(8),
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.multiline,
        placeholder: 'Type a message...',
        placeholderStyle: const TextStyle(
          color: Color.fromARGB(255, 196, 198, 204),
          fontSize: 16.0,
        ),
        suffix: Padding(
          padding: const EdgeInsets.all(2),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(100))),
            child: IconButton(
              onPressed: iconTap,
              icon: const Icon(
                Icons.send_sharp,
                size: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100.0)),
          color: Color(0xffF0F1F5),
        ),
        
      ),
    );
  }
}
