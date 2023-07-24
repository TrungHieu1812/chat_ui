import 'package:flutter/material.dart';

import '../BloC/bloc_chat.dart';
import '../models/Message_model.dart';

class ChatBottomSheet extends StatefulWidget {
  const ChatBottomSheet({super.key, required this.chat_bloc});

  final ChatBloc chat_bloc;

  @override
  State<ChatBottomSheet> createState() => _ChatBottomSheetState();
}

class _ChatBottomSheetState extends State<ChatBottomSheet> {
  bool flag = false;
  bool send = false;
  TextEditingController messageController = TextEditingController();

  handleFlag() {
    setState(() {
      flag = !flag;
      send = true;
    });
  }

  handleIconFlag() {
    setState(() {
      flag = false;
    });
  }

  sendMessage() {
    widget.chat_bloc.sendMessage(Message("you", messageController.text));
    // Future.delayed(Duration(seconds: 2), () {
    //   widget.chat_bloc.receiverMessage(Message("bot", faker.conference.name()));
    // });

    messageController.clear();
    // widget.chat_bloc.receiverMessage(ChatEvent.receiver);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            SizedBox(
              width: flag ? 40 : (MediaQuery.of(context).size.width - 30) / 2,
              child: flag
                  ? InkWell(
                      onTap: handleFlag,
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.blue,
                        size: 35,
                      ),
                    )
                  : const Row(
                      children: [
                        Icon(
                          Icons.add_circle,
                          color: Colors.blue,
                          size: 30,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.photo_camera,
                          color: Colors.blue,
                          size: 30,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.image,
                          color: Colors.blue,
                          size: 30,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.mic,
                          color: Colors.blue,
                          size: 30,
                        )
                      ],
                    ),
            ),
            SizedBox(
              width: flag
                  ? MediaQuery.of(context).size.width - 60
                  : (MediaQuery.of(context).size.width - 30) / 2,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    width: flag
                        ? MediaQuery.of(context).size.width - 105
                        : (MediaQuery.of(context).size.width - 120) / 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextFormField(
                        controller: messageController,
                        onTap: handleFlag,
                        onEditingComplete: sendMessage,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Aa",
                            suffixIcon: Icon(
                              Icons.emoji_emotions,
                              size: 30,
                              color: Colors.blue,
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: sendMessage,
                    child: Icon(
                      send ? Icons.send : Icons.thumb_up,
                      color: Colors.blue,
                      size: 35,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';

// class ChatBottomSheet extends StatelessWidget {
//   const ChatBottomSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SizedBox(
//         height: 40,
//         child: Row(
//           children: [
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.add_circle,
//                 color: Colors.blue,
//                 size: 25,
//               ),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.photo_camera,
//                 color: Colors.blue,
//                 size: 25,
//               ),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.photo_library,
//                 color: Colors.blue,
//                 size: 25,
//               ),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.mic,
//                 color: Colors.blue,
//                 size: 25,
//               ),
//             ),
//             const Expanded(
//               child: TextField(
//                 keyboardType: TextInputType.multiline,
//                 maxLines: 4,
//                 minLines: 1,
//                 style: TextStyle(
//                   color: Colors.black,
//                   decoration: TextDecoration.none,
//                 ),
//                 decoration: InputDecoration(
//                   contentPadding:
//                       EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                   hintText: 'Aa',
//                   hintStyle:
//                       TextStyle(color: Color.fromARGB(255, 187, 186, 186)),
//                   filled: true,
//                   fillColor: Color.fromARGB(255, 223, 223, 223),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(25)),
//                     borderSide:
//                         BorderSide(color: Color.fromARGB(255, 223, 223, 223)),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(15)),
//                     borderSide:
//                         BorderSide(color: Color.fromARGB(255, 223, 223, 223)),
//                   ),
//                   suffixIcon: Icon(
//                     Icons.emoji_emotions,
//                     color: Colors.blue,
//                     size: 25,
//                   ),
//                 ),
//               ),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.thumb_up_rounded,
//                 color: Colors.blue,
//                 size: 25,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
