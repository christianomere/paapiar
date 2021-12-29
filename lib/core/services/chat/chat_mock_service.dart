import 'dart:async';
import 'dart:math';

import 'package:paapiar/core/models/chat_message.dart';
import 'package:paapiar/core/models/paapiar_user.dart';
import 'chat_service.dart';


class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [
    ChatMessage(id: '1',
        text: 'Bom dia',
        createdAt: DateTime.now(),
        userId: '123',
        userName: 'Bia',
        userImageURL: 'assets/images/avatar.png'),

    ChatMessage(id: '2',
        text: 'Vai ter bar hoje',
        createdAt: DateTime.now(),
        userId: '456',
        userName: 'Igor',
        userImageURL: 'assets/images/avatar.png'),

    ChatMessage(id: '1',
        text: 'claroo!',
        createdAt: DateTime.now(),
        userId: '123',
        userName: 'Bia',
        userImageURL: 'assets/images/avatar.png'),
  ];

  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _msgsStream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
    controller.add(_msgs);
  });

  Stream<List<ChatMessage>> messagesStream() {
    return _msgsStream;
  }

  Future<ChatMessage> save(String text, PaapiarUser user) async {
    final newMessage = ChatMessage(
      id: Random().nextDouble().toString(),
      text: text,
      createdAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImageURL: user.imageURL,
    );
    _msgs.add(newMessage);
    _controller?.add(_msgs.reversed.toList());
    return newMessage;
  }
}
