import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  final tesoura = Image.asset('assets/images/tesoura.png', width: 100, height: 100);
  final papel = Image.asset('assets/images/papel.png', width: 100, height: 100);
  final pedra = Image.asset('assets/images/pedra.png', width: 100, height: 100);
  final inicial = Image.asset('assets/images/mario.gif', width: 100, height: 100);
  late Image computador = inicial;
  late int pontuacao = 0;
  late int pontuacaoComputador = 0;
  late int pontuacaoEmpate = 0;
  late int escolhaComputador = 0;
  late int escolhaJogador = 0;
  late double tamanhoPedra = 100;
  late double tamanhoPapel = 100;
  late double tamanhoTesoura = 100;
  late bool botaoHabilitado = false;
  late bool zerarPontuacao = false;
  late String escolha = 'Escolha do Computador:';

  void selecionarImagem(String escolha) {
    setState(() {
      botaoHabilitado = true;
      if (escolha == 'pedra') {
        tamanhoPedra = 120;
        tamanhoPapel = 100;
        tamanhoTesoura = 100;
        computador = papel;
      } else if (escolha == 'papel') {
        tamanhoPedra = 100;
        tamanhoPapel = 120;
        tamanhoTesoura = 100;
        computador = tesoura;
      } else if (escolha == 'tesoura') {
        tamanhoPedra = 100;
        tamanhoPapel = 100;
        tamanhoTesoura = 120;
        computador = pedra;
      }
    });
  }

  void jogar() {
    setState(() {
      Random random = Random();
      escolhaComputador = random.nextInt(3) + 1;
      escolha = 'Escolha do Computador:';
      zerarPontuacao = true;

      for (int i = 0; i < 10; i++) {
        Future.delayed(Duration(milliseconds: i * 200), () {
          setState(() {
            if (i % 3 == 0) {
              computador = pedra;
            } else if (i % 3 == 1) {
              computador = papel;
            } else {
              computador = tesoura;
            }

            // After the last blink, show final result
            if (i == 9) {
              if (escolhaComputador == 1) {
                computador = pedra;
              } else if (escolhaComputador == 2) {
                computador = papel;
              } else if (escolhaComputador == 3) {
                computador = tesoura;
              }

              if (escolhaJogador == escolhaComputador) {
                pontuacaoEmpate++;
              } else if ((escolhaJogador == 1 && escolhaComputador == 3) ||
                  (escolhaJogador == 2 && escolhaComputador == 1) ||
                  (escolhaJogador == 3 && escolhaComputador == 2)) {
                pontuacao++;
              } else {
                pontuacaoComputador++;
              }
              Future.delayed(Duration(seconds: 2), () {
                setState(() {
                  botaoHabilitado = false;
                  tamanhoPedra = 100;
                  tamanhoPapel = 100;
                  tamanhoTesoura = 100;
                  computador = inicial;

                });
              });
            }
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(192, 207, 197, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back, color: Color.fromARGB(255, 54, 73, 63), size: 30),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Pontuação:',
                  style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 54, 73, 63), fontFamily: "BubblegumSans"),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Jogador: $pontuacao',
                  style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 54, 73, 63), fontFamily: "BubblegumSans"),
                ),
                Text(
                  'Empate: $pontuacaoEmpate',
                  style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 54, 73, 63), fontFamily: "BubblegumSans"),
                ),
                Text(
                  'Computador: $pontuacaoComputador',
                  style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 54, 73, 63), fontFamily: "BubblegumSans"),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  escolha,
                  style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 54, 73, 63), fontFamily: "BubblegumSans"),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [computador],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Escolha do Jogador:',
                  style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 54, 73, 63), fontFamily: "BubblegumSans"),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    selecionarImagem('pedra');
                    escolhaJogador = 1;
                    escolha = 'Escolha potencial do Computador: ';
                  },
                  child: Image.asset(
                    'assets/images/pedra.png',
                    width: tamanhoPedra,
                    height: tamanhoPedra,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    selecionarImagem('papel');
                    escolhaJogador = 2;
                    escolha = 'Escolha potencial do Computador: ';
                  },
                  child: Image.asset(
                    'assets/images/papel.png',
                    width: tamanhoPapel,
                    height: tamanhoPapel,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    selecionarImagem('tesoura');
                    escolhaJogador = 3;
                    escolha = 'Escolha potencial do Computador: ';
                  },
                  child: Image.asset(
                    'assets/images/tesoura.png',
                    width: tamanhoTesoura,
                    height: tamanhoTesoura,
                  ),
                ),
              ],
            ),
            SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    backgroundColor: botaoHabilitado
                        ?  Color.fromARGB(255, 54, 73, 63)
                        : Colors.grey,
                  ),
                  onPressed: botaoHabilitado
                      ? () {
                          jogar();
                          setState(() {
                            botaoHabilitado = false;
                          });
                        }
                      : null,
                  child: Text(
                    'Jogar',
                    style: TextStyle(fontSize: 20, color: const Color.fromRGBO(192, 207, 197, 1), fontFamily: "BubblegumSans"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Clique na imagem para escolher',
                  style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 54, 73, 63), fontFamily: "BubblegumSans"),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    backgroundColor: zerarPontuacao
                        ?  Color.fromARGB(255, 54, 73, 63)
                        : Colors.grey,
                  ),
                  onPressed: zerarPontuacao 
                  ? () {
                    setState(() {
                      pontuacao = 0;
                      pontuacaoComputador = 0;
                      pontuacaoEmpate = 0;
                      zerarPontuacao = false;
                    }
                    );
                  }
                  :null,
                  child: Text(
                    'Zerar Pontuação',
                    style: TextStyle(fontSize: 15, color: const Color.fromRGBO(192, 207, 197, 1), fontFamily: "BubblegumSans"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}