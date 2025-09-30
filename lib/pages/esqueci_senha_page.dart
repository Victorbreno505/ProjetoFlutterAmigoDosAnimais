// RF003 (Esqueceu a senha)

import 'package:flutter/material.dart';

class EsqueciSenhaPage extends StatelessWidget {
  const EsqueciSenhaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Esqueceu a Senha?'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Informe seu e-mail para receber as instruções de recuperação de senha.',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30.0),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                //chamada para a sua API de recuperação de senha.
                // Por exemplo, uma chamada HTTP
                
                // Exemplo de feedback usando SnackBar (RF006)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Instruções de recuperação enviadas para o seu e-mail.'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: const Text('Recuperar Senha', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}