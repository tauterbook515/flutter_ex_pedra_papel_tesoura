import 'package:flutter/material.dart';
import 'jogo.dart'; // You'll need to create this file later

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(192, 207, 197, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(192, 207, 197, 1),
        title: const Text('Pedra, Papel e Tesoura', style: TextStyle(fontSize: 30,fontFamily: "BubblegumSans",color: Color.fromRGBO(59, 74, 66, 1)),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Image.asset("assets/images/icone-inicial.png", width: 300, height: 300),
            SizedBox(height: 100),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            backgroundColor: const Color.fromARGB(255, 54, 73, 63),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Jogo()),
            );
          },
          child: const Text(
            'Iniciar Jogo',
            style: TextStyle(fontSize: 25, color: Color.fromRGBO(192, 207, 197, 1), fontFamily: "BubblegumSans"),
          ),
        ),
          ],
        ),
      ),
    );
  }
}