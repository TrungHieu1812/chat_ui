// ignore_for_file: override_on_non_overriding_member

import 'package:chat_ui/BloC/state_chat.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event_chat.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(InitialChatState());

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    if (event is SendMessageEvent) {
      // Xử lý logic khi gửi tin nhắn
      yield MessageSentState();
    } else if (event is ReceiveMessageEvent) {
      // Xử lý logic khi nhận tin nhắn
      yield MessageReceivedState(message: event.message);
    }
  }
}
