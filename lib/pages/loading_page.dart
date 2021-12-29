import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff221573),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 10.0,
              ),
              height: 100.0,
              width: 100.0,
            ),
            SizedBox(
              height: 30.0,
            ),
            Text('Segura ai que está carregando',
            style: TextStyle(
              color: Colors.white
            )),
          ],
        ),
      ),
    );
  }
}
