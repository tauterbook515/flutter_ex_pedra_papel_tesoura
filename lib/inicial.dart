import 'package:flutter/material.dart';
import 'jogo.dart'; // You'll need to create this file later

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(229, 235, 231, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(229, 235, 231, 1),
        title: const Text('Pedra, Papel e Tesoura', style: TextStyle(fontSize: 20,fontFamily: "BubblegumSans"),),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Jogo()),
            );
          },
          child: const Text(
            'Iniciar Jogo',
            style: TextStyle(fontSize: 20, color: Colors.black,fontFamily: "BubblegumSans"),
          ),
        ),
      ),
    );
  }
}