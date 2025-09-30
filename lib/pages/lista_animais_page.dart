// RF005 (Outras funcionalidades)
//RF007 (Listagem de dados)

import 'package:flutter/material.dart';

class ListaAnimaisPage extends StatelessWidget {
  const ListaAnimaisPage({super.key});

  // Dados de exemplo para demonstração
  final List<Map<String, String>> animais = const [
    {
      'nome': 'Rex',
      'especie': 'Cachorro',
      'localizacao': 'Avenida PIO XII, nº 0',
      'status': 'Disponível para Adoção'
    },
    {
      'nome': 'Mimi',
      'especie': 'Gato',
      'localizacao': 'Rua do Plotze, 1000',
      'status': 'Em Tratamento'
    },
    {
      'nome': 'Bolinha',
      'especie': 'Cachorro',
      'localizacao': 'Praca XV, s/n',
      'status': 'Adotado'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Animais'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: animais.length,
        itemBuilder: (context, index) {
          final animal = animais[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    animal['nome']!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text('Espécie: ${animal['especie']}'),
                  Text('Localização: ${animal['localizacao']}'),
                  const SizedBox(height: 10),
                  Text(
                    'Status: ${animal['status']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: animal['status'] == 'Adotado'
                          ? Colors.green
                          : animal['status'] == 'Em Tratamento'
                              ? Colors.orange
                              : Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}