import 'dart:math';

import 'package:flutter/material.dart';

void main(){

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora IMC',
      home: TelaPrincipal(),

      //Tema
      theme: ThemeData(
        primaryColor: Colors.blue[900],
        backgroundColor: Colors.grey[100],
        fontFamily: 'Roboto',  //Raleway
        textTheme: TextTheme(
          headline1: TextStyle(fontSize:  22, color: Colors.white),
          headline2: TextStyle(fontSize:  36),
          headline3: TextStyle(fontSize:  18, fontStyle: FontStyle.italic),
        ),

      ),

    )
  );

}

//
// TELA PRINCIPAL
//
class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {

  //Atributos para armazenar os valores digitados pelo usuário
  var _txtPeso = TextEditingController();
  var _txtAltura = TextEditingController();

  //Atributo para identificar unicamente o formulário
  var _formId = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC', 
            style: Theme.of(context).textTheme.headline1
        ),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,

        actions: [

          IconButton(
            icon: Icon(Icons.delete_rounded), 
            onPressed: (){
              
              setState(() {
                _formId.currentState.reset();
                _txtPeso.clear();
                _txtAltura.clear();
                FocusScope.of(context).unfocus();
              });                

            }
          )

        ],

      ),
      backgroundColor: Theme.of(context).backgroundColor,

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40),
          child: Form(
            key: _formId,
            child: Column(children: [
              Icon(Icons.people_alt, 
                size: 120, 
                color:  Theme.of(context).primaryColor
              ),

              campoTexto('Peso', _txtPeso),
              campoTexto('Altura', _txtAltura),
              botao('calcular'),

            ]),
          ),
        ),
      ),
    );
  }


  //
  // CAMPO DE TEXTO para entrada de dados
  //
  Widget campoTexto(rotulo,variavel){

    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(

        //entrada de somente números
        keyboardType: TextInputType.number,

        //variável que receberá o valor contido no campo de texto
        controller: variavel,

        style: Theme.of(context).textTheme.headline2,
        decoration: InputDecoration(
          labelText: rotulo,
          labelStyle: Theme.of(context).textTheme.headline3,

          hintText: 'Entre com o valor',
          hintStyle: Theme.of(context).textTheme.headline3,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        //validação da entrada de dados
        validator: (value){

          if (double.tryParse(value) == null){
            return 'Entre com um valor numérico';
          }else{
            return null;  //tudo certo com a conversão para double
          }

        },


      ),

    );

  }

  //
  // BOTÃO
  //
  Widget botao(rotulo){
    return Container(
      padding: EdgeInsets.only(top: 20),
      width: double.infinity,
      height: 70,
      child: ElevatedButton(
        child: Text(rotulo, style: Theme.of(context).textTheme.headline1),
        onPressed: (){
          //print('botão pressionado!');

          //chamar o validador dos campos de texto
          if (_formId.currentState.validate()){

            //O método setState é utilizado todas as vezes que é 
            //necessário alterar o estado do App
            setState(() {
              double peso = double.parse(_txtPeso.text);
              double altura = double.parse(_txtAltura.text);
              double imc = peso/pow(altura,2);
              caixaDialogo('O valor do IMC é ${imc.toStringAsFixed(2)}');
            });

          }

        },        
      ),
    );
  }

  //
  // CAIXA DE DIÁLOGO
  //
  caixaDialogo(msg){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
            title: Text('Resultado'),
            content: Text(msg),
            actions: [
              TextButton(
                child: Text('fechar'),  
                onPressed: (){Navigator.of(context).pop();},
              ),
            ],
        );
      }
    );
  }

}