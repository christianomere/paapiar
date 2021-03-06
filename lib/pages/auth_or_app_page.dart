import 'package:flutter/material.dart';
import 'package:paapiar/core/models/paapiar_user.dart';
import 'package:paapiar/core/services/auth/auth_mock_service.dart';
import 'package:paapiar/pages/auth_page.dart';
import 'package:paapiar/pages/chat_page.dart';
import 'package:paapiar/pages/loading_page.dart';

class AuthOrAppPage extends StatelessWidget {
  const AuthOrAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<PaapiarUser?>(

        stream: AuthMockService().userChanges,
        builder: (ctx, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return LoadingPage();
          } else{
            return snapshot.hasData ? ChatPage() : AuthPage();
          }
        },
      ),
    );
  }
}
