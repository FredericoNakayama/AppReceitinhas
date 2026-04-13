import 'package:flutter/material.dart';
import '../models/receita.dart';

class TelaCadastroReceita extends StatefulWidget {
  const TelaCadastroReceita({super.key});

  @override
  State<TelaCadastroReceita> createState() => _TelaCadastroReceitaState();
}

class _TelaCadastroReceitaState extends State<TelaCadastroReceita> {
  final nomeController = TextEditingController();
  final ingredientesController = TextEditingController();
  final modoPreparoController = TextEditingController();
  final tempoPreparoController = TextEditingController();
  final porcoesController = TextEditingController();

  String dificuldadeSelecionada = 'Fácil';

  @override
  void dispose() {
    nomeController.dispose();
    ingredientesController.dispose();
    modoPreparoController.dispose();
    tempoPreparoController.dispose();
    porcoesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Receitinha'),
        backgroundColor: Colors.pink[200],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Nome da Receita',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                hintText: 'Ex: Bolo de Cenoura',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Tempo de Preparo',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: tempoPreparoController,
              decoration: const InputDecoration(
                hintText: 'Ex: 30 minutos',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Dificuldade',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: dificuldadeSelecionada,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              items: ['Fácil', 'Médio', 'Difícil']
                  .map((nivel) => DropdownMenuItem(
                        value: nivel,
                        child: Text(nivel),
                      ))
                  .toList(),
              onChanged: (novoValor) {
                setState(() {
                  dificuldadeSelecionada = novoValor!;
                });
              },
            ),
            const SizedBox(height: 16),
            const Text('Ingredientes',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: ingredientesController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Um ingrediente por linha',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Modo de Preparo',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: modoPreparoController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Descreva o passo a passo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Porções',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: porcoesController,
              decoration: const InputDecoration(
                hintText: 'Quantas pessoas essa receita serve?',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[200],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  if (nomeController.text.isEmpty ||
                      ingredientesController.text.isEmpty ||
                      modoPreparoController.text.isEmpty ||
                      tempoPreparoController.text.isEmpty ||
                      porcoesController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Preencha todos os campos!'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }
                  final novaReceita = Receita(
                    nome: nomeController.text,
                    dificuldade: dificuldadeSelecionada,
                    tempoPreparo: tempoPreparoController.text,
                    ingredientes: ingredientesController.text,
                    modoPreparo: modoPreparoController.text,
                    porcoes: porcoesController.text,
                  );
                  Navigator.pop(context, novaReceita);
                },
                child: const Text(
                  'Salvar Receitinha',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}