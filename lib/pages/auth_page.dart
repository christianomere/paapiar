import 'package:flutter/material.dart';
import 'package:paapiar/components/auth_form.dart';
import 'package:paapiar/core/models/auth_form_data.dart';
import 'package:paapiar/core/services/auth/auth_service.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading = false;

  Future<void> _handleSubmit(AuthFormData formData) async {
    try {
      setState(() => _isLoading = true);

      if (formData.isLogin) {
        // Login
        await AuthService().login(
          formData.email,
          formData.password,
        );
      } else {
        // Signup
        await AuthService().signup(
          formData.name,
          formData.email,
          formData.password,
          formData.image,
        );
      }
    } catch (error) {
      print(error.toString());
      // Tratar erro!
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4772ff),
      body: Stack(
        children: [
          Center(child: AuthForm(onSubmit: _handleSubmit)
          ),
          if(_isLoading) Container(
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
