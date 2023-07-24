import 'package:chat_ui/BloC/state_chat.dart';
import 'package:chat_ui/models/RecentChat_model.dart';
import 'package:flutter/material.dart';

import '../BloC/bloc_chat.dart';
import '../Widgets/ChatBottomSheet.dart';
import '../Widgets/ChatBuddleReceiver.dart';
import '../Widgets/ChatBuddleSend.dart';
import '../models/Message_model.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
  static Route route(RecentChat_model data) =>
      MaterialPageRoute(builder: (context) => ChatPage(recentChat: data));

  ChatPage({super.key, required this.recentChat});

  final RecentChat_model recentChat;

  // ignore: non_constant_identifier_names
  var chat_bloc = ChatBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color.fromARGB(255, 7, 135, 255),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [AppBarChat(messageData: recentChat)],
        ),
      ),
      body: StreamBuilder(
        stream: chat_bloc.state,
        builder: (context, snapshot) {
          ChatState? state = snapshot.data;
          if (snapshot.hasData) {
            return Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 70),
              child: Expanded(
                child: ListView.builder(
                  itemCount: state!.messages.length,
                  itemBuilder: (context, index) {
                    Message message = state.messages[index];
                    return state.isBot
                        ? ChatBuddleReceiver(messageLeft: message.text)
                        : ChatBuddleSend(messageRight: message.text);
                  },
                ),
              ),
            );
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(recentChat.image),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      recentChat.name,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "Facebook",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text("Các bạn là bạn bè trên facebook")
                  ],
                ),
              ),
            );
          }
        },
      ),
      bottomSheet: ChatBottomSheet(
        chat_bloc: chat_bloc,
      ),
    );
  }
}

class AppBarChat extends StatelessWidget {
  const AppBarChat({
    super.key,
    required this.messageData,
  });

  final RecentChat_model messageData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 230,
              child: ListTile(
                leading: SizedBox(
                  width: 45,
                  height: 45,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue,
                    backgroundImage: NetworkImage(messageData.image),
                  ),
                ),
                title: Text(
                  messageData.name,
                  style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold),
                ),
                // subtitle: Text(
                //   "Đang hoạt động",
                //   style: TextStyle(color: Colors.lightGreen),
                // ),
              ),
            ),
            const Row(
              children: [
                Icon(
                  Icons.phone,
                  size: 28,
                  color: Color.fromARGB(255, 7, 135, 255),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.videocam,
                  size: 30,
                  color: Color.fromARGB(255, 7, 135, 255),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
