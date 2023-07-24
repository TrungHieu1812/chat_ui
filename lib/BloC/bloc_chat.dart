// ignore_for_file: override_on_non_overriding_member

import 'dart:async';

import 'package:chat_ui/BloC/state_chat.dart';

import '../models/Message_model.dart';
import 'event_chat.dart';

class ChatBloc {
  final _stateController = StreamController<ChatState>();
  @override
  Stream<ChatState> get state => _stateController.stream;
  final List<Message> _listMessage = [];

  void dispose() {
    _stateController.close();
  }

  void onAction(ChatEvent action, Message message) {
    switch (action) {
      case ChatEvent.send:
        sendMessage(message);
        break;
      case ChatEvent.receiver:
        receiverMessage(message);
        break;

      default:
        break;
    }
  }

  void sendMessage(Message message) async {
    _stateController.sink.add(ChatState.isPerson(_listMessage));
    _listMessage.add(message);
  }

  void receiverMessage(Message message) async {
    _stateController.sink.add(ChatState.isBot(_listMessage));
    _listMessage.add(message);
  }
}
