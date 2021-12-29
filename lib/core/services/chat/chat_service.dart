import 'package:paapiar/core/models/chat_message.dart';
import 'package:paapiar/core/models/paapiar_user.dart';

import 'chat_mock_service.dart';

abstract class ChatService {
  Stream<List<ChatMessage>> messagesStream();
  Future<ChatMessage> save(String text, PaapiarUser user);

  factory ChatService() {
    return ChatMockService();
  }
}
