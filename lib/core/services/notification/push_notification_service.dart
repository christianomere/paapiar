import 'package:flutter/material.dart';
import 'package:paapiar/core/models/chat_notification.dart';

class PushNotificationService with ChangeNotifier {
  List<ChatNotification> _items = [];
  List<ChatNotification> get items {
    return[..._items];
  }
  void add(ChatNotification notification){
    _items.add(notification);
    notifyListeners();
  }
  void remove(int i){
    _items.removeAt(i);
  }
}