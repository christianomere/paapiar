import 'package:flutter/material.dart';
import 'package:paapiar/core/services/auth/auth_service.dart';
import 'package:paapiar/core/services/chat/chat_service.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  String _message = '';

  final _messageController = TextEditingController();

  Future<void> _sendMessage() async {
    final user = AuthService().currentUser;

    if(user != null) {
      await ChatService().save(_message, user);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          SizedBox(height: 30.0,),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.camera_alt_outlined,
                      size: 25,
                      color: const Color(0xffc5e6ff),
                    ),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.mic,
                      size: 25,
                      color: const Color(0xffc5e6ff),
                    ),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.photo,
                      size: 25,
                      color: const Color(0xffc5e6ff),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _messageController,
                      onChanged: (msg) => setState(() => _message = msg),
                      decoration: InputDecoration(
                        labelText: 'Enviar mensagens',
                      ),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.arrow_upward_rounded,
                      size: 30,
                        color: const Color(0xffc5e6ff),
                      ),
                    onPressed: _message.trim().isEmpty ? null : _sendMessage,
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(
                  color: const Color(0xff4772ff),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(60),
            ),
          ),
        ],
      ),
    );
  }
}
