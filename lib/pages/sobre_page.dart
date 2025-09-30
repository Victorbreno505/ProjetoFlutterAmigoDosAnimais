// RF004 (Sobre)

import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre o Amigo dos Animais'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Para que o app serve?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Sabemos que o trabalho de cuidar e proteger animais de rua é incrível, mas pode ser bem difícil de organizar. Por isso, criamos o "Amigo dos Animais" — um app feito para simplificar a vida de quem está na linha de frente.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Com ele, você pode registrar cada animalzinho que precisa de ajuda de um jeito rápido e fácil, ver qual região mais precisa de atenção e ainda acompanhar cada adoção, do início ao fim. Nossa missão é tirar o peso do "papel" do seu ombro, para que você possa se dedicar 100% a quem realmente importa: os animais.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            Text(
              'Quem fez isso?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Este aplicativo é uma iniciativa do Victor Breno A. Matos como Trabalho de projeto na Fatec RP, feito com muito carinho e dedicação para ajudar a causa animal.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}