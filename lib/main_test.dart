import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F5F3),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF5F5F3),
          foregroundColor: Colors.blue,
        ),
      ),
      home: const ChatPage(),
    );
  }
}

// Message class
class Message {
  final String text;
  final DateTime timestamp;

  Message(this.text, this.timestamp);
}

// Bloc
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState([]));

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is SendMessageEvent) {
      final newMessages = List<Message>.from(state.messages)
        ..add(Message(event.text, DateTime.now()));
      yield ChatState(newMessages);
    }
  }
}

// State
class ChatState {
  final List<Message> messages;

  ChatState(this.messages);
}

// Event
abstract class ChatEvent {}

class SendMessageEvent extends ChatEvent {
  final String text;

  SendMessageEvent(this.text);
}

// UI
class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Chat')),
        body: Column(
          children: [
            Expanded(child: _MessagesList()),
            _MessageInput(),
          ],
        ),
      ),
    );
  }
}

class _MessagesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.messages.length,
          itemBuilder: (context, index) {
            final message = state.messages[index];
            return ListTile(
              title: Text(message.text),
              subtitle: Text(message.timestamp.toIso8601String()),
            );
          },
        );
      },
    );
  }
}

class _MessageInput extends StatefulWidget {
  @override
  __MessageInputState createState() => __MessageInputState();
}

class __MessageInputState extends State<_MessageInput> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'Enter message'),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              context.read<ChatBloc>().add(SendMessageEvent(_controller.text));
              _controller.clear();
            },
          ),
        ],
      ),
    );
  }
}
