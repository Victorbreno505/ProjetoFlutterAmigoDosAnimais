// RF005 (Outras funcionalidades)
//RF006 (Caixa de Diálogo)

import 'package:flutter/material.dart';

class CadastroAnimalPage extends StatefulWidget {
  const CadastroAnimalPage({super.key});

  @override
  State<CadastroAnimalPage> createState() => _CadastroAnimalPageState();
}

class _CadastroAnimalPageState extends State<CadastroAnimalPage> {
  final _formKey = GlobalKey<FormState>();
  
    // 1. Informações Básicas do Animal
  final _nomeController = TextEditingController();
  final _racaController = TextEditingController();
  final _idadeController = TextEditingController();
  String? _especieSelecionada;
  String? _unidadeIdadeSelecionada;
  String? _sexoSelecionado;
  final _corController = TextEditingController();
  
  // 2. Localização do Resgate
  final _enderecoController = TextEditingController();
  final _pontoReferenciaController = TextEditingController();
  
  // 3. Condição Atual do Animal
  String? _saudeSelecionada;
  String? _comportamentoSelecionado;
  String? _statusSelecionado;

  // 5. Observações Adicionais
  final _observacoesController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _racaController.dispose();
    _idadeController.dispose();
    _enderecoController.dispose();
    _pontoReferenciaController.dispose();
    _corController.dispose();
    _observacoesController.dispose();
    super.dispose();
  }

  void _limparCampos() {
    _formKey.currentState!.reset();
    _nomeController.clear();
    _racaController.clear();
    _idadeController.clear();
    _enderecoController.clear();
    _pontoReferenciaController.clear();
    _corController.clear();
    _observacoesController.clear();
    setState(() {
      _especieSelecionada = null;
      _unidadeIdadeSelecionada = null;
      _sexoSelecionado = null;
      _saudeSelecionada = null;
      _comportamentoSelecionado = null;
      _statusSelecionado = null;
    });
  }

  void _salvarCadastro() {
    if (_formKey.currentState!.validate()) {
      // Lógica para salvar os dados do animal
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Animal cadastrado com sucesso!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Amigo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. Informações Básicas
              const Text('Informações Básicas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Divider(),
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: 'Nome do Animal'),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                initialValue: _especieSelecionada,
                hint: const Text('Espécie'),
                onChanged: (newValue) {
                  setState(() {
                    _especieSelecionada = newValue;
                  });
                },
                items: ['Gato', 'Cachorro', 'Outro'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _racaController,
                decoration: const InputDecoration(labelText: 'Raça (opcional)'),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _idadeController,
                      decoration: const InputDecoration(labelText: 'Idade Estimada'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: DropdownButtonFormField<String>(
                      initialValue: _unidadeIdadeSelecionada,
                      hint: const Text('Unidade'),
                      onChanged: (newValue) {
                        setState(() {
                          _unidadeIdadeSelecionada = newValue;
                        });
                      },
                      items: ['Anos', 'Meses'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Sexo:', style: TextStyle(fontSize: 16)),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Macho'),
                      value: 'Macho',
                      groupValue: _sexoSelecionado,
                      onChanged: (value) {
                        setState(() {
                          _sexoSelecionado = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Fêmea'),
                      value: 'Fêmea',
                      groupValue: _sexoSelecionado,
                      onChanged: (value) {
                        setState(() {
                          _sexoSelecionado = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _corController,
                decoration: const InputDecoration(labelText: 'Cor/Pelagem'),
              ),
              const SizedBox(height: 40),
              
              // 2. Localização do Resgate
              const Text('Localização do Resgate', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Divider(),
              TextFormField(
                controller: _enderecoController,
                decoration: const InputDecoration(labelText: 'Endereço (com CEP)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'O endereço é obrigatório';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _pontoReferenciaController,
                decoration: const InputDecoration(labelText: 'Ponto de Referência (opcional)'),
              ),
              const SizedBox(height: 20),
              // Data de Resgate
              ListTile(
                title: const Text('Data do Resgate'),
                subtitle: Text('Não implementado'),
                trailing: const Icon(Icons.calendar_today),
                onTap: () {
                  // Lógica para seleção de data (tenho de terminar depois)
                },
              ),
              const SizedBox(height: 40),
              
              // 3. Condição Atual do Animal
              const Text('Condição Atual', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Divider(),
              DropdownButtonFormField<String>(
                initialValue: _saudeSelecionada,
                hint: const Text('Estado de Saúde'),
                onChanged: (newValue) {
                  setState(() {
                    _saudeSelecionada = newValue;
                  });
                },
                items: ['Saudável', 'Machucado', 'Doente'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                initialValue: _comportamentoSelecionado,
                hint: const Text('Comportamento'),
                onChanged: (newValue) {
                  setState(() {
                    _comportamentoSelecionado = newValue;
                  });
                },
                items: ['Dócil', 'Agressivo', 'Medroso'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              const Text('Status:', style: TextStyle(fontSize: 16)),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Disponível'),
                      value: 'Disponível para Adoção',
                      groupValue: _statusSelecionado,
                      onChanged: (value) {
                        setState(() {
                          _statusSelecionado = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Em Tratamento'),
                      value: 'Em Tratamento',
                      groupValue: _statusSelecionado,
                      onChanged: (value) {
                        setState(() {
                          _statusSelecionado = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: const Text('Adotado'),
                      value: 'Adotado',
                      groupValue: _statusSelecionado,
                      onChanged: (value) {
                        setState(() {
                          _statusSelecionado = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              
              // 4. Fotos
              const Text('Fotos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Divider(),
              Container(
                height: 200,
                color: Colors.grey[300],
                child: const Center(
                  child: Text('Área para Upload de Fotos (não implementado)'),
                ),
              ),
              const SizedBox(height: 40),
              
              // 5. Observações Adicionais
              const Text('Observações Adicionais', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Divider(),
              TextFormField(
                controller: _observacoesController,
                decoration: const InputDecoration(
                  labelText: 'Descrição, hábitos, etc.',
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
              ),
              const SizedBox(height: 40),

              // Botões
              ElevatedButton(
                onPressed: _salvarCadastro,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text('Salvar Cadastro', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
              const SizedBox(height: 10),
              OutlinedButton(
                onPressed: _limparCampos,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.grey),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: const Text('Limpar Campos', style: TextStyle(fontSize: 18, color: Colors.grey)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}