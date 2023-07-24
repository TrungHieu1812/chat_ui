import 'package:chat_ui/models/Active_model.dart';
import 'package:flutter/material.dart';

class ActiveChats extends StatelessWidget {
  const ActiveChats({super.key, required this.activeData});

  final Active_model activeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Expanded(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 90,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blue,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(activeData.url),
                        radius: 28,
                      ),
                    ),
                    Expanded(
                        child: Padding(
                      padding:
                          const EdgeInsets.only(top: 16.0, left: 5, right: 5),
                      child: Text(
                        activeData.name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                    ))
                  ],
                ),
              );
            }),
      ),
    );
  }
}
