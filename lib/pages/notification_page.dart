import 'package:flutter/material.dart';
import 'package:paapiar/core/services/notification/chat_notification_service.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<ChatNotificationService>(context);
    final items = service.items;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('Notificações',
          style: TextStyle(
            fontFamily: 'SF Pro Text',
            fontSize: 30,
            color: Color(0xff221573),
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: service.itemsCount,
          itemBuilder:(ctx, i) => ListTile(
              title: Text(items[i].title,
              style: TextStyle(
                fontFamily: 'SF Pro Text',
                fontSize: 15,
                color:  Color(0xff4772ff),
                fontWeight: FontWeight.w500,
                ),
              ),
              subtitle:Text(items[i].body) ,
               onTap: () => service.remove(i),
            ),
        ),
      ),
    );
  }
}
