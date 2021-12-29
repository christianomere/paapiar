import 'package:flutter/material.dart';
import 'package:paapiar/components/messages.dart';
import 'package:paapiar/components/new_message.dart';
import 'package:paapiar/components/paapiar_svg.dart';
import 'package:paapiar/core/services/auth/auth_service.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded,
              color:  Color(0xff4772ff)),
          onPressed: () {  },
        ),

        title: Text('DM',
          style: TextStyle(
            fontFamily: 'SF Pro Text',
            fontSize: 30,
            color: Color(0xff221573),
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: DropdownButton(
              icon: Icon(
                Icons.info_outline,
                color:  Color(0xff4772ff),
              ),
              items: [
                DropdownMenuItem(
                  value: 'perfil',
                  child: Container(
                    child: Text('Meu Perfil',
                      style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 15,
                        color:  Color(0xff4772ff),
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 'contacts',
                  child: Container(
                    child: Text('Meus Amigos',
                      style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 15,
                        color:  Color(0xff4772ff),
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 'settings',
                  child: Container(
                    child: Text('Configurações',
                      style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 15
                        ,
                        color:  Color(0xff4772ff),
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 'logout',
                  child: Container(
                    child: Text('Sair',
                      style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 30,
                        color: Color(0xff221573),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ],
              onChanged: (value) {
                if (value == 'logout') {
                  AuthService().logout();
                }
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Messages()),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}

