import 'package:flutter/material.dart';
import 'dart:math';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  var _imageApp = AssetImage("assets/images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imageApp = AssetImage("assets/images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imageApp = AssetImage("assets/images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imageApp = AssetImage("assets/images/tesoura.png");
        });
        break;
    }

    if(
      (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
      (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
      (escolhaUsuario == "tesoura" && escolhaApp == "papel")
    ){
      setState(() {
        this._mensagem = "Parabéns!!! Você ganhou! :)";
      });
    }else if (
      (escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
      (escolhaApp == "papel" && escolhaUsuario == "pedra") ||
      (escolhaApp == "tesoura" && escolhaUsuario == "papel")
    ){
      setState(() {
        this._mensagem = "Você perdeu! :(";
      });
    }else{
      setState(() {
        this._mensagem = "Empatamos!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image(
            image: this._imageApp,
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("assets/images/pedra.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("assets/images/papel.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("assets/images/tesoura.png", height: 100),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
