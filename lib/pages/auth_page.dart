import 'package:flutter/material.dart';
import 'package:paapiar/components/auth_form.dart';
import 'package:paapiar/models/auth_form_data.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoadin = false;
  void _handleSubmit(AuthFormData formData){
    setState(() => _isLoadin = true);

    print('AuthPage');
    print(formData.email);

    setState(() => _isLoadin = false);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4772ff),
      body: Stack(
        children: [
          Center(child: AuthForm(onSubmit: _handleSubmit)
          ),
          if(_isLoadin) Container(
            decoration: BoxDecoration(
                color: Color(0xCC221573),
            ),
            child: Center(
              child: SizedBox(
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 10.0,
                ),
                height: 100.0,
                width: 100.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
