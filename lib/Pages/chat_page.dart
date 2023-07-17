import 'package:flutter/material.dart';

import '../Widgets/ChatBottomSheet.dart';
import '../Widgets/ChatSample.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: AppBar(
            leadingWidth: 30,
            title: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'assets/images/avatar.png',
                    height: 45,
                    width: 45,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Trung Hieu",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.call, size: 30),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.video_call_rounded, size: 30),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding:
            const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 80),
        children: const [
          ChatSample(),
          ChatSample(),
          ChatSample(),
          ChatSample(),
          ChatSample(),
          ChatSample(),
          ChatSample(),
          ChatSample(),
        ],
      ),
      bottomSheet: const ChatBottomSheet(),
    );
  }
}

// class ChatPage extends StatefulWidget {
//   const ChatPage({super.key});

//   @override
//   State<ChatPage> createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Container(
//         padding: const EdgeInsets.only(top: 10),
//         child: Scaffold(
//           backgroundColor: Colors.black,
//           appBar: AppBar(
//             automaticallyImplyLeading: false,
//             flexibleSpace: const app_bar(),
//             backgroundColor: Colors.black,
//           ),
//           body: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [chat_input()],
//           ),
//         ),
//       ),
//     );
//   }

//   // ignore: non_constant_identifier_names
//   SizedBox chat_input() {
//     return SizedBox(
//       height: 40,
//       child: Row(
//         children: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.add_circle,
//               color: Colors.purpleAccent,
//               size: 25,
//             ),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.photo_camera,
//               color: Colors.purpleAccent,
//               size: 25,
//             ),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.photo_library,
//               color: Colors.purpleAccent,
//               size: 25,
//             ),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.mic,
//               color: Colors.purpleAccent,
//               size: 25,
//             ),
//           ),
//           const Expanded(
//             child: TextField(
//               keyboardType: TextInputType.multiline,
//               maxLines: null,
//               style: TextStyle(
//                   color: Colors.white, decoration: TextDecoration.none),
//               decoration: InputDecoration(
//                 contentPadding:
//                     EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                 hintText: 'Aa',
//                 hintStyle: TextStyle(color: Color.fromARGB(255, 187, 186, 186)),
//                 filled: true,
//                 fillColor: Color.fromARGB(255, 122, 122, 122),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(25)),
//                   borderSide:
//                       BorderSide(color: Color.fromARGB(255, 122, 122, 122)),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(15)),
//                   borderSide:
//                       BorderSide(color: Color.fromARGB(255, 122, 122, 122)),
//                 ),
//                 suffixIcon: Icon(
//                   Icons.emoji_emotions,
//                   color: Colors.purpleAccent,
//                   size: 25,
//                 ),
//               ),
//             ),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.thumb_up_rounded,
//               color: Colors.purpleAccent,
//               size: 25,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ignore: camel_case_types
// class app_bar extends StatelessWidget {
//   const app_bar({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//             margin: const EdgeInsets.only(top: 10),
//             child: IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.arrow_back_ios_new,
//                 color: Colors.purpleAccent,
//                 size: 25,
//               ),
//             )),
//         Container(
//           margin: const EdgeInsets.only(top: 10, right: 15),
//           child: Image.asset(
//             'assets/images/fb_icon.png',
//             height: 40,
//           ),
//         ),
//         Container(
//           margin: const EdgeInsets.only(top: 10),
//           child: const Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Trung Hiếu',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 21,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 'Hoạt động 15 phút trước',
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 16,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           margin: const EdgeInsets.only(top: 20, left: 47),
//           child: const Icon(
//             Icons.call,
//             color: Colors.purpleAccent,
//             size: 30,
//           ),
//         ),
//         Container(
//           margin: const EdgeInsets.only(top: 20, left: 15),
//           child: const Icon(
//             Icons.video_call_rounded,
//             color: Colors.purpleAccent,
//             size: 35,
//           ),
//         ),
//       ],
//     );
//   }
// }
