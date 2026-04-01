import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const AppReceitinhas());
}

class AppReceitinhas extends StatelessWidget {
  const AppReceitinhas({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'App Receitinhas',
      debugShowCheckedModeBanner: false,
      home: TelaInicial(),
    );
  }
}

class TelaInicial extends StatefulWidget {
  const TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  final List<Receita> receitinhas = [
    Receita(
        nome: 'Macarrão com Cogumelo',
        dificuldade: 'Difícil',
        tempoPreparo: '1h 30min',
        ingredientes: 'Macarrao, cogumelo...',
        modoPreparo: 'Ferva água...',
        porcoes: '4 pessoas'),
    Receita(
        nome: 'Banoff',
        dificuldade: 'Difícil',
        tempoPreparo: '1h 30min',
        ingredientes: 'Banana, leite...',
        modoPreparo: 'Corte a Banana...',
        porcoes: '4 pessoas'),
    Receita(
        nome: 'Batata Frita de Carinha',
        dificuldade: 'Fácil',
        tempoPreparo: '20 min',
        ingredientes: 'Batata de carinha',
        modoPreparo: 'Bote oleo na panela...',
        porcoes: '2 pessoas'),
    Receita(
        nome: 'Bombom de Uva',
        dificuldade: 'Médio',
        tempoPreparo: '1h 30min',
        ingredientes: 'Uva, leite...',
        modoPreparo: 'Não sei fazer.. .',
        porcoes: '4 pessoas'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        leading: Icon(Icons.local_restaurant),
        title: const Text('Receitinhas Deliciosas'),
        backgroundColor: Colors.pink[200],
      ),
      body: receitinhas.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.no_food, size: 100, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'Nenhuma receitinha :(',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemCount: receitinhas.length,
              itemBuilder: (context, index) {
                return ListTile(
                    leading:
                        Icon(Icons.article_outlined, color: Colors.pink[200]),
                    title: Text(receitinhas[index].nome),
                    subtitle: Text(receitinhas[index].dificuldade),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TelaDetalhe(receita: receitinhas[index])));
                    },
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          receitinhas.removeAt(index);
                        });
                      },
                    ));
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink[200],
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            receitinhas.add(Receita(
                nome: 'Nova Receita',
                dificuldade: 'N/A',
                tempoPreparo: 'N/A',
                ingredientes: 'N/A',
                modoPreparo: 'N/A',
                porcoes: 'N/A'));
          });
        },
      ),
    );
  }
}

class Receita {
  String nome;
  String dificuldade;
  String tempoPreparo;
  String ingredientes;
  String modoPreparo;
  String porcoes;

  Receita(
      {required this.nome,
      required this.dificuldade,
      required this.tempoPreparo,
      required this.ingredientes,
      required this.modoPreparo,
      required this.porcoes});
}

class TelaDetalhe extends StatelessWidget {
  final Receita receita;

  const TelaDetalhe({required this.receita});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        title: Text(receita.nome),
        backgroundColor: Colors.pink[200],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.timer, color: Colors.pink[200]),
                SizedBox(width: 8),
                Text(receita.tempoPreparo),
                SizedBox(width: 24),
                Icon(Icons.bar_chart, color: Colors.pink[200]),
                SizedBox(width: 8),
                Text(receita.dificuldade),
                SizedBox(width: 24),
                Icon(Icons.people, color: Colors.pink[200]),
                SizedBox(width: 8),
                Text(receita.porcoes)
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Ingredientes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              receita.ingredientes,
              style: TextStyle(fontSize: 16, height: 1.6),
            ),
            SizedBox(height: 24),
            Text(
              'Modo de Preparo',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              receita.modoPreparo,
              style: TextStyle(fontSize: 16, height: 1.6),
            )
          ],
        ),
      ),
    );
  }
}

class TelaCadastroReceita extends StatefulWidget {
  const TelaCadastroReceita({Key? key}) : super(key: key);

  @override
  State<TelaCadastroReceita> createState() => _TelaCadastroReceitaState();
}

class _TelaCadastroReceitaState extends State<TelaCadastroReceita> {
  final nomeController = TextEditingController();
  final ingredientesController = TextEditingController();
  final modoPreparoController = TextEditingController();
  final tempoPreparoController = TextEditingController();
  final porcoesController = TextEditingController();

  String dificuldadeSelecionada = "Fácil";

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
              decoration: InputDecoration(
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
                  hintText: 'Ex: 30 minutos', border: OutlineInputBorder()),
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
              maxLines: 20,
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
              maxLines: 20,
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
              maxLines: 2,
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
                  final novaReceita = Receita(
                      nome: nomeController.text,
                      dificuldade: dificuldadeSelecionada,
                      tempoPreparo: tempoPreparoController.text,
                      ingredientes: ingredientesController.text,
                      modoPreparo: modoPreparoController.text,
                      porcoes: porcoesController.text);
                  Navigator.pop(context, novaReceita);
                },
                child: const Text(
                  'Salvar Receitinha',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
