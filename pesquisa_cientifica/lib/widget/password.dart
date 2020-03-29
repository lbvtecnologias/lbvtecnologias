import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  @override
  _PasswordInputState createState() => _PasswordInputState();

  String senha;
  final EditController = TextEditingController();
}

class _PasswordInputState extends State<PasswordInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          controller: this.widget.EditController,
          style: TextStyle(
            color: Colors.white,
          ),
          obscureText: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: 'Senha',
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
            onChanged: (text) {
              this.widget.senha = this.widget.EditController.text;
              print(this.widget.senha);
            }
        ),
      ),
    );
  }
}