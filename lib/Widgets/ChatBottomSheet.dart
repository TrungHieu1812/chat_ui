import 'package:flutter/material.dart';

class ChatBottomSheet extends StatelessWidget {
  const ChatBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_circle,
                color: Colors.blue,
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.photo_camera,
                color: Colors.blue,
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.photo_library,
                color: Colors.blue,
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.mic,
                color: Colors.blue,
                size: 25,
              ),
            ),
            const Expanded(
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: TextStyle(
                    color: Colors.black, decoration: TextDecoration.none),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  hintText: 'Aa',
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 187, 186, 186)),
                  filled: true,
                  fillColor: Color.fromARGB(255, 223, 223, 223),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 223, 223, 223)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 223, 223, 223)),
                  ),
                  suffixIcon: Icon(
                    Icons.emoji_emotions,
                    color: Colors.blue,
                    size: 25,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.thumb_up_rounded,
                color: Colors.blue,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
