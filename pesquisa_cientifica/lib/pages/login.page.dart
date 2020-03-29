import 'package:flutter/material.dart';
import 'package:pesquisa_cientifica/widget/button.dart';
import 'package:pesquisa_cientifica/widget/first.dart';
import 'package:pesquisa_cientifica/widget/forgot.dart';
import 'package:pesquisa_cientifica/widget/inputEmail.dart';
import 'package:pesquisa_cientifica/widget/password.dart';
import 'package:pesquisa_cientifica/widget/textLogin.dart';
import 'package:pesquisa_cientifica/widget/verticalText.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.teal, Colors.tealAccent]),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(children: <Widget>[
                  VerticalText(),
                  TextLogin(),
                ]),
                InputEmail(),
                PasswordInput(),
                ButtonLogin(usuario: InputEmail().EditController.text.toLowerCase(),
                              senha: PasswordInput().EditController.text.toString()),
                FirstTime(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}