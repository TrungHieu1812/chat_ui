import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'BloC/bloc_chat.dart';
import 'BloC/event_chat.dart';
import 'BloC/state_chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ChatScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final ChatBloc _chatBloc = ChatBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat App'),
      ),
      body: BlocBuilder<ChatBloc, ChatState>(
        bloc: _chatBloc,
        builder: (context, state) {
          if (state is MessageSentState) {
            // Hiển thị thông báo khi tin nhắn được gửi đi
            return const Text('Message sent');
          } else if (state is MessageReceivedState) {
            // Hiển thị tin nhắn khi nhận được tin nhắn mới
            return Text(state.message);
          } else {
            // Hiển thị giao diện để nhập tin nhắn mới
            return TextField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: 'Enter your message',
              ),
              onSubmitted: (message) {
                _chatBloc.add(SendMessageEvent(message: message));
                _textController.clear();
              },
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _chatBloc.close();
    super.dispose();
  }
}
