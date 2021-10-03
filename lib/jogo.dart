import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _resultado = "Escolha uma opção";
  var _escolhaComputadorImagem = AssetImage("lib/assets/padrao.png");
  var _pontuacao = 0;
  void _opcaoSelecionada(String opcaoUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var nEscolha = Random().nextInt(opcoes.length - 1);
    var opcaoComputador = opcoes[nEscolha];

    var resultado = "";

    if (opcaoUsuario == opcaoComputador) {
      resultado = "Temos um empate!";
    } else if ((opcaoUsuario == "pedra" && opcaoComputador == "tesoura") ||
        (opcaoUsuario == "tesoura" && opcaoComputador == "papel") ||
        (opcaoUsuario == "papel" && opcaoComputador == "pedra")) {
      resultado = "Você ganhou!";
      _pontuacao++;
    } else {
      resultado = "Você perdeu!";
    }
    setState(() {
      _escolhaComputadorImagem = AssetImage("lib/assets/$opcaoComputador.png");
      _resultado = resultado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jokenpo'),
      ),
      body: Column(
        children: [
          const Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha do App",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Image(image: _escolhaComputadorImagem),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _resultado,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("lib/assets/pedra.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("lib/assets/papel.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("lib/assets/tesoura.png", height: 100),
              ),
            ],
          ),
          Text("Sua pontuação é: $_pontuacao")
        ],
      ),
    );
  }
}
