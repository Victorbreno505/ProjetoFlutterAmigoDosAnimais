// lib/main.dart

// Importações de pacotes necessários
import 'package:flutter/material.dart';
import 'package:amigo_dos_animais/pages/login_page.dart'; 


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  // O método 'build' é obrigatório em todo widget.
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amigo dos Animais',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      // Primeira tela qu vai ser exibida
   

      home: const LoginPage(),
    );
  }
}

