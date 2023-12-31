import 'package:chat_ui/models/Active_model.dart';
import 'package:chat_ui/models/RecentChat_model.dart';
import 'package:flutter/material.dart';

import '../Widgets/ActiveChats.dart';
import '../Widgets/RecentChats.dart';
import 'package:faker/faker.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        shadowColor: Colors.white,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 128),
            child: Text(
              "Chat",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Icon(Icons.notifications),
          ),
        ],
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 232, 230, 230),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    style: const TextStyle(decoration: TextDecoration.none),
                    decoration: const InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        ActiveChats(
          activeData: Active_model(
            name: faker.person.name(),
            url: faker.image.image(width: 50, height: 50, random: true),
          ),
        ),
        RecentChats(
          recentChat: RecentChat_model(
            name: faker.person.name(),
            image: faker.image.image(width: 50, height: 50, random: true),
            content: faker.conference.name(),
            time: faker.date.justTime(),
          ),
        ),
      ]),
    );
  }
}
