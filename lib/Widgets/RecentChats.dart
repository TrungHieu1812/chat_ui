import 'package:chat_ui/Pages/chat_page.dart';
import 'package:chat_ui/models/RecentChat_model.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
  const RecentChats({super.key, required this.recentChat});

  final RecentChat_model recentChat;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   margin: const EdgeInsets.only(top: 10),
    //   padding: const EdgeInsets.symmetric(horizontal: 20),
    //   child: Column(
    //     children: [
    //       for (int i = 0; i < 10; i++)
    //         Padding(
    //           padding: const EdgeInsets.symmetric(vertical: 15),
    //           child: InkWell(
    //             onTap: () {
    //               Navigator.pushNamed(context, "chatPage");
    //             },
    //             child: SizedBox(
    //               height: 65,
    //               child: Row(
    //                 children: [
    //                   ClipRRect(
    //                     borderRadius: BorderRadius.circular(35),
    //                     child: Image.asset(
    //                       'assets/images/avatar.png',
    //                       height: 65,
    //                       width: 65,
    //                     ),
    //                   ),
    //                   const Padding(
    //                     padding:
    //                         EdgeInsets.symmetric(horizontal: 15, vertical: 8),
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           "Trung Hieu",
    //                           style: TextStyle(
    //                             fontSize: 18,
    //                             fontWeight: FontWeight.w500,
    //                           ),
    //                         ),
    //                         SizedBox(
    //                           height: 8,
    //                         ),
    //                         Text('Đang làm gì đấy fen?...',
    //                             style: TextStyle(
    //                               fontSize: 16,
    //                               color: Colors.black54,
    //                             )),
    //                       ],
    //                     ),
    //                   ),
    //                   const Padding(
    //                     padding: EdgeInsets.only(top: 8, left: 60),
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.center,
    //                       children: [
    //                         Text(
    //                           "12:30",
    //                           style: TextStyle(
    //                             fontSize: 15,
    //                             color: Colors.black54,
    //                           ),
    //                         )
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //     ],
    //   ),
    // )
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(recentChat.image),
        radius: 28,
      ),
      title: Text(
        recentChat.name,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Row(children: [
        SizedBox(
          width: 200,
          child: Text(
            recentChat.content,
            style: const TextStyle(overflow: TextOverflow.ellipsis),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Text(recentChat.time)
      ]),
      // trailing: Container(
      //   width: 10,
      //   height: 10,
      //   decoration: BoxDecoration(
      //       borderRadius: BorderRadius.circular(10), color: Colors.blue),
      // ),
      // onTap: () => {Navigator.pushNamed(context, "chatPage")},
      onTap: () => {Navigator.of(context).push(ChatPage.route(recentChat))},
    );
  }
}
