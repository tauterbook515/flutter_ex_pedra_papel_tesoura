import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  final tesoura = Image.asset('assets/images/tesoura.png', width: 100, height: 100,);
  final papel = Image.asset('assets/images/papel.png', width: 100, height: 100,);
  final pedra = Image.asset('assets/images/pedra.png', width: 100, height: 100,);
  late Image computador = pedra;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(229, 235, 231, 1),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              computador,
            ],),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            pedra,
            papel,
            tesoura
          ],)

          ],
        ),
      ),
    );
  }
}