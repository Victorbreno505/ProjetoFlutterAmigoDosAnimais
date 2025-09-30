
import 'package:flutter/material.dart';
import 'package:amigo_dos_animais/pages/sobre_page.dart';
import 'package:amigo_dos_animais/pages/cadastro_animal_page.dart';
import 'package:amigo_dos_animais/pages/lista_animais_page.dart';
import 'package:amigo_dos_animais/pages/relatorios_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Estatico necessario Implementacao futura com banco de dados
  final String _totalAdotados = '15';
  final String _animaisDisponiveis = '7';
  final Map<String, String> _ultimoAnimalCadastrado = const {
    'nome': 'Max',
    'especie': 'Cachorro',
    'localizacao': 'Centro, SP',
    'status': 'Disponível para Adoção',
    'imagem': 'assets/max.jpg', 
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Amigo dos Animais'), // Título mais amigável ?
        centerTitle: true,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Cabeçalho do Drawer
            const UserAccountsDrawerHeader(
              accountName: Text('Olá, Usuário'), // Implementar e Substituir por dados dinâmicos 
              accountEmail: Text(''),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),


            // Opções do Menu
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('Cadastrar Amigo'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CadastroAnimalPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Lista de Animais'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ListaAnimaisPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.bar_chart),
              title: const Text('Relatórios'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const RelatoriosPage()),
                );
              },
            ),
            const Divider(), // Linha divisória
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Sobre'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SobrePage()),
                );
              },
            ),
          ],
        ),
      ),


      body: SingleChildScrollView( // Usar SingleChildScrollView para evitar overflow
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            // Logo Central (mantido)
            Image.asset(
              'assets/logo.png', 
              height: 150,
            ),
            const SizedBox(height: 150),

            // Card de Resumo do Relatório
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Resumo Geral',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                    ),
                    const Divider(color: Colors.blueAccent),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Total de Adotados:', style: TextStyle(fontSize: 16)),
                        Text(_totalAdotados, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Disponíveis para Adoção:', style: TextStyle(fontSize: 16)),
                        Text(_animaisDisponiveis, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Card do Último Animal Cadastrado
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Último Amigo Cadastrado',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                    ),
                    const Divider(color: Colors.blueAccent),
                    const SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Imagem do animal
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: _ultimoAnimalCadastrado['imagem'] != null && _ultimoAnimalCadastrado['imagem']!.isNotEmpty
                              ? Image.asset(
                                  _ultimoAnimalCadastrado['imagem']!,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => Container(
                                    width: 100,
                                    height: 100,
                                    color: Colors.grey[200],
                                    child: const Icon(Icons.pets, size: 50, color: Colors.grey),
                                  ),
                                )
                              : Container(
                                  width: 100,
                                  height: 100,
                                  color: Colors.grey[200],
                                  child: const Icon(Icons.pets, size: 50, color: Colors.grey),
                                ),
                        ),
                        const SizedBox(width: 15),
                        // Detalhes do animal
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _ultimoAnimalCadastrado['nome']!,
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Text('Espécie: ${_ultimoAnimalCadastrado['especie']}'),
                              Text('Localização: ${_ultimoAnimalCadastrado['localizacao']}'),
                              Text(
                                'Status: ${_ultimoAnimalCadastrado['status']}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: _ultimoAnimalCadastrado['status'] == 'Adotado'
                                      ? Colors.green
                                      : _ultimoAnimalCadastrado['status'] == 'Em Tratamento'
                                          ? Colors.orange
                                          : Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Botão para ver todos os animais (opcional)
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ListaAnimaisPage()),
                );
              },
              icon: const Icon(Icons.pets, color: Colors.white),
              label: const Text('Ver Todos os Amigos', style: TextStyle(fontSize: 18, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}