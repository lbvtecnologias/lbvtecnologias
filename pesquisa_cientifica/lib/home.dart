import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pesquisa_cientifica/etapa2.dart';

import 'package:pesquisa_cientifica/spring_button.dart';

//void main() => runApp(MyApp());

class Etapa1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste de frequencia intermitente',
      theme: ThemeData(primarySwatch: Colors.teal, brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      home: Etapa1Page(title: 'FonoCount - Etapa 1'),
    );
  }


}

class Etapa1Page extends StatefulWidget {
  Etapa1Page({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Etapa1PageState createState() => _Etapa1PageState();
}

class _Etapa1PageState extends State<Etapa1Page> {
  Timer timer;
  int counterBA = 0;
  int counterDA = 0;

  @override
  void initState() {
    super.initState();
    _setTimer();
  }

  void incrementCounterBA() {
    setState(() {
      counterBA++;
      timer.cancel();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Etapa2Page(title: 'FonoCount - Etapa 2', contagemba: counterBA, contagemda: counterDA,),),);
    });
  }

  void incrementCounterDA() {
    setState(() {
      counterDA++;
      timer.cancel();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Etapa2Page(title: 'FonoCount - Etapa 2', contagemba: counterBA, contagemda: counterDA,),),);
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
                "ABACATE",
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
                "ADACATE",
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
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) =>
              Etapa2Page(title: 'FonoCount - Etapa 2',
                contagemba: counterBA,
                contagemda: counterDA,),),);
      });
      timer.cancel();
    });
  }
}
