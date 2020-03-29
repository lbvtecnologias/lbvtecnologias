import 'package:flutter/material.dart';
import 'package:pesquisa_cientifica/widget/button.dart';

class InputEmail extends StatefulWidget {
  @override
  _InputEmailState createState() => _InputEmailState();

  String nome;
  // ignore: non_constant_identifier_names
  final EditController = TextEditingController();

}

class _InputEmailState extends State<InputEmail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextField(
          controller: this.widget.EditController,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: Colors.lightBlueAccent,
            labelText: 'Nome',
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
            onChanged: (text) {
              this.widget.nome = this.widget.EditController.text;
              print(this.widget.nome);
            }

        ),
      ),
    );
  }
}