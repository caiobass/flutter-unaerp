import 'package:flutter/material.dart';

void main() => runApp(Exercicio1());

class Exercicio1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text('Tela Inicial'),
            actions: [Icon(Icons.home, size: 40)],
          ),
          body: Column(
            children: [
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 8, color: Colors.black),
                          color: Colors.purple[900],
                        ),
                        child: Center(
                          child: Text('A', style: TextStyle(fontSize: 40)),
                        )),
                  ),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 8, color: Colors.black),
                          color: Colors.purple[50],
                        ),
                        child: Center(
                            child: Text(
                          'B',
                          style: TextStyle(fontSize: 40),
                        ))),
                  )
                ],
              )),
              Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 8, color: Colors.black),
                          color: Colors.grey,
                        ),
                      child: Center(
                          child: Text(
                        'C',
                        style: TextStyle(fontSize: 40),
                      )))),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                          border: Border.all(width: 8, color: Colors.black),
                          color: Colors.purple[900]
                          ),
                          child: Center(
                              child: Text(
                            'D',
                            style: TextStyle(fontSize: 40),
                          )))),
                  Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                          border: Border.all(width: 8, color: Colors.black),
                          ),
                          child: Center(
                              child: Text('E',
                                  style: TextStyle(
                                    fontSize: 40,
                                    /*fontWeight: FontWeight.bold*/
                                  )))))
                ],
              )),
            ],
          )),
    );
  }
}
