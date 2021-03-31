import 'package:flutter/material.dart';

void main() => runApp(Exercicio1());

class Exercicio1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text('Tela Inicial'),
            actions: [Icon(Icons.home, size: 40)],
          ),
      )
    );
  }
}
