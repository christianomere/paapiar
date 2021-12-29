import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paapiar/models/auth_form_data.dart';
import 'paapiar_svg.dart';

class AuthForm extends StatefulWidget {
  final void Function(AuthFormData) onSubmit;
  const AuthForm({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = AuthFormData();

  void _submit(){
    final isValid = _formKey.currentState?.validate() ?? false;
    if(!isValid) return;
    widget.onSubmit(_formData);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 25.0),
          child: Container(
            child: SvgPicture.asset(illustrationHomeSvg,
              height: 278.83,
              width: 300.0,
            ),
          ),
        ),
        Spacer(),
        Form(
          key: _formKey,
          child: Container(
            color: Colors.white,
            width: double.infinity,
            height: _formData.isLogin ? 430.0 : 365,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(_formData.isLogin ? 'Entrar' : 'Cadastrar',
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 30,
                          color: const Color(0xff221573),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        child: Text(_formData.isLogin ? 'Não sou cadastrado' : 'Já sou cadastrado' ,
                        style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 20,
                          color: const Color(0xff4772ff),
                          fontWeight: FontWeight.w300,
                          height: 1.95,
                          ),
                        ),
                        onPressed: (){
                          setState(() {
                            _formData.toogleAuthMode();
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox( height: 20.0,),
                  if(_formData.isLogin)
                  TextFormField(
                    key: ValueKey('name'),
                    initialValue: _formData.name,
                    onChanged: (name) => _formData.name = name,
                    validator: (_name){
                      final name = _name ?? '';
                      if(name.trim().length < 4){
                        return 'O nome é muito curto, deve ter mínimo 4 letras';
                      }
                      return null;
                    },
                    decoration:
                    InputDecoration(
                    prefixIcon: Icon(Icons.person_outline),
                    labelText: 'Nome',
                    suffixIcon: Icon(Icons.info_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60.0),
                      borderSide: BorderSide(
                        color: const Color(0xff221573),
                        ),
                      ),
                    ),
                  ),
                  SizedBox( height: 15.0),
                  TextFormField(
                    key: ValueKey('email'),
                    initialValue: _formData.email,
                    onChanged: (email) => _formData.email = email,
                    validator: (_email){
                      final email = _email ?? '';
                      if(!email.contains('@')){
                        return 'email invalido fata o @';
                      }
                      return null;
                    },
                    decoration:
                    InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: 'Email',
                    suffixIcon: Icon(Icons.info_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60.0),
                      borderSide: BorderSide(
                        color: const Color(0xff221573),
                      ),
                    ),
                  ),
                  ),
                  SizedBox( height: 15.0),
                  TextFormField(
                    key: ValueKey('password'),
                    initialValue: _formData.password,
                    onChanged: (password) => _formData.password = password,
                    validator: (_password){
                      final password = _password ?? '';
                      if(password.length < 6){
                        return 'senha muito fraca, no minimo 6 letras';
                      }
                      return null;
                    },
                    decoration:
                    InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    labelText: 'Senha',
                    suffixIcon: Icon(Icons.info_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60.0),
                      borderSide: BorderSide(
                        color: const Color(0xff221573),
                      ),
                    ),
                  ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),

                  Row(
                    children: [
                      TextButton(
                        onPressed: (){},
                        child:Text('Termos de privacidae',
                          style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontSize: 15,
                            color: const Color(0xff4772ff),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      Spacer(),
                      GestureDetector(
                        child: Container(
                          width: 80.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: const Color(0xff221573),
                            borderRadius: BorderRadius.all(Radius.circular(60.0),
                            ),
                          ),
                          child: Icon(Icons.arrow_forward_rounded,
                            color: Color(0xffc5e6ff),
                            size: 35.0,
                          ),
                        ),
                        onTap: _submit,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
