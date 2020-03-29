import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pesquisa_cientifica/resultado.dart';

import 'package:pesquisa_cientifica/spring_button.dart';

class Etapa3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste de frequencia intermitente',
      theme: ThemeData(primarySwatch: Colors.teal, brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: Etapa3Page(title: 'FonoCount - Etapa 2'),
    );
  }
}

class Etapa3Page extends StatefulWidget {
  Etapa3Page({Key key, this.title, this.contagemba, this.contagemda}) : super(key: key);

  final String title;
  int contagemba;
  int contagemda;

  @override
  _Etapa3PageState createState() => _Etapa3PageState();
}

class _Etapa3PageState extends State<Etapa3Page> {
  Timer timer;

  @override
  void initState() {
    super.initState();
    _setTimer();
  }

  void incrementCounterBA() {
    setState(() {
      this.widget.contagemba++;
      timer.cancel();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>resultadoPage(title: 'FonoCount - Resultado', contagemba: this.widget.contagemba, contagemda: this.widget.contagemda,)));
    });
  }

  void incrementCounterDA() {
    setState(() {
      this.widget.contagemda++;
      timer.cancel();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>resultadoPage(title: 'FonoCount - Resultado', contagemba: this.widget.contagemba, contagemda: this.widget.contagemda,)));
    });
  }

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
                "",
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
                "BARCO",
                Colors.deepPurpleAccent,
              ),
              onTapDown: (_) => incrementCounterBA(),
              onLongPress: () => timer = Timer.periodic(
                const Duration(milliseconds: 100),
                (_) => incrementCounterBA(),
              ),
              onLongPressEnd: (_) {
                timer?.cancel();
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: SpringButton(
              SpringButtonType.OnlyScale,
              row(
                "DARCO",
                Colors.redAccent,
              ),
              onTapDown: (_) => incrementCounterDA(),
              onLongPress: () => timer = Timer.periodic(
                const Duration(milliseconds: 100),
                (_) => incrementCounterDA(),
              ),
              onLongPressEnd: (_) {
                timer?.cancel();
              },
            ),
          ),Expanded(
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

  void _setTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>resultadoPage(title: 'FonoCount - Resultado', contagemba: this.widget.contagemba, contagemda: this.widget.contagemda,)));
      });
      timer.cancel();
    });
  }

}
