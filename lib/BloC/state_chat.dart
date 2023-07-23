import 'package:equatable/equatable.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class InitialChatState extends ChatState {}

class MessageSentState extends ChatState {}

class MessageReceivedState extends ChatState {
  final String message;

  const MessageReceivedState({required this.message});

  @override
  List<Object> get props => [message];
}
