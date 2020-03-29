import 'dart:async';

import 'package:flutter/material.dart';

import 'package:pesquisa_cientifica/spring_button.dart';

//void main() => runApp(MyApp());

class resultado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste de frequencia intermitente',
      theme: ThemeData(primarySwatch: Colors.teal, brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: resultadoPage(title: 'FonoCount - Etapa 2'),
    );
  }
}

class resultadoPage extends StatefulWidget {
  resultadoPage({Key key, this.title, this.contagemba, this.contagemda}) : super(key: key);

  final String title;
  int contagemba;
  int contagemda;

  @override
  _resultadoPageState createState() => _resultadoPageState();
}

class _resultadoPageState extends State<resultadoPage> {
  Widget row(String text, Color color) {
    return Padding(
      padding: EdgeInsets.all(12.5),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12.5,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), leading: Icon(Icons.headset),),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "As Palavras com BA foram selecionadas: ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SpringButton(
              SpringButtonType.OnlyScale,
              row(
                this.widget.contagemba.toString(),
                Colors.deepPurpleAccent,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: Center(
              child: Text(
                "As Palavras com DA foram selecionadas",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SpringButton(
              SpringButtonType.OnlyScale,
              row(
                this.widget.contagemda.toString(),
                Colors.redAccent,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                "",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
