import 'package:flutter/material.dart';
import 'package:paapiar/core/services/auth/auth_mock_service.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text('ChatPage'),
            ),
            TextButton(
            onPressed: (){AuthMockService().logout();},
             child: Text('Logout'),)
          ],
        ),
    );
  }
}
