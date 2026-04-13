import 'package:flutter/material.dart';
import '../models/receita.dart';
import 'tela_detalhe.dart';
import 'tela_cadastro.dart';

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
      porcoes: '4 pessoas',
    ),
    Receita(
      nome: 'Banoff',
      dificuldade: 'Difícil',
      tempoPreparo: '1h 30min',
      ingredientes: 'Banana, leite...',
      modoPreparo: 'Corte a Banana...',
      porcoes: '4 pessoas',
    ),
    Receita(
      nome: 'Batata Frita de Carinha',
      dificuldade: 'Fácil',
      tempoPreparo: '20 min',
      ingredientes: 'Batata de carinha',
      modoPreparo: 'Bote oleo na panela...',
      porcoes: '2 pessoas',
    ),
    Receita(
      nome: 'Bombom de Uva',
      dificuldade: 'Médio',
      tempoPreparo: '1h 30min',
      ingredientes: 'Uva, leite...',
      modoPreparo: 'Não sei fazer...',
      porcoes: '4 pessoas',
    ),
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
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: receitinhas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.article_outlined, color: Colors.pink[200]),
                  title: Text(receitinhas[index].nome),
                  subtitle: Text(receitinhas[index].dificuldade),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TelaDetalhe(receita: receitinhas[index]),
                      ),
                    );
                  },
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        receitinhas.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink[200],
        child: const Icon(Icons.add),
        onPressed: () async {
          final novaReceita = await Navigator.push<Receita>(
            context,
            MaterialPageRoute(
              builder: (context) => const TelaCadastroReceita(),
            ),
          );
          if (novaReceita != null) {
            setState(() {
              receitinhas.add(novaReceita);
            });
          }
        },
      ),
    );
  }
}