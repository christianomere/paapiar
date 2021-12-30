import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paapiar/core/models/chat_message.dart';

class MessageBubble extends StatelessWidget {
  static const _defaultImage = 'assets/images/avatar.png';
  final ChatMessage message;
  final bool belongsToCurrentUser;

  const MessageBubble({
    Key? key,
    required this.message,
    required this.belongsToCurrentUser
  }) : super(key: key);

  Widget _showUserImage(String imageURL) {
    ImageProvider? provider;
    final uri = Uri.parse(imageURL);

    if (uri.path.contains(_defaultImage)) {
      provider = AssetImage(_defaultImage);
    } else if (uri.scheme.contains('http')) {
      provider = NetworkImage(uri.toString());
    } else {
      provider = FileImage(File(uri.toString()));
    }

    return CircleAvatar(
      backgroundImage: provider,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: belongsToCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: belongsToCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Text(message.userName,
                style: TextStyle(
                  fontFamily: 'SF Pro Text',
                  fontSize: 12,
                  color: const Color(0xff221573),
                  letterSpacing: 0.12,
                  height: 1.5,
                ),),
            ),
            Container(
                width: 330.0,
                margin: const EdgeInsets.symmetric(
                  horizontal: 15.0
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: belongsToCurrentUser ? Color(0xff221573) : Color(0xff4772ff),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                  child: Row(
                    children: [
                      if(!belongsToCurrentUser)
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: _showUserImage(message.userImageURL),
                      ),
                      if(belongsToCurrentUser)
                      Spacer(),
                      Expanded(
                        child: Text(message.text,
                          textAlign: belongsToCurrentUser ? TextAlign.right : TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontSize: 15,
                            color: const Color(0xffffffff),
                            height: 1.2,
                          ),
                        ),
                      ),
                      if(belongsToCurrentUser)
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: _showUserImage(message.userImageURL),),
                    ],
                  ),
                ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Text('12, Dec, 20:45',
                style: TextStyle(
                  fontFamily: 'SF Pro Text',
                  fontSize: 12,
                  color: const Color(0xff221573),
                  letterSpacing: 0.12,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
