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
      modoPreparo: 'Ferva água...'
    ),
    Receita(
      nome: 'Banoff', 
      dificuldade: 'Difícil', 
      tempoPreparo: '1h 30min', 
      ingredientes: 'Banana, leite...', 
      modoPreparo: 'Corte a Banana...'
    ),
    Receita(
      nome: 'Batata Frita de Carinha', 
      dificuldade: 'Fácil', 
      tempoPreparo: '20 min', 
      ingredientes: 'Batata de carinha', 
      modoPreparo: 'Bote oleo na panela...'
    ),
    Receita(
      nome: 'Bombom de Uva', 
      dificuldade: 'Médio', 
      tempoPreparo: '1h 30min', 
      ingredientes: 'Uva, leite...', 
      modoPreparo: 'Não sei fazer...'
    ),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          receitinhas.removeAt(index);
                        }
                      );
                    },
                  )
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink[200],
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            receitinhas.add(
              Receita(
                nome: 'Nova Receita', 
                dificuldade: 'N/A',
                tempoPreparo: 'N/A',
                ingredientes: 'N/A',
                modoPreparo: 'N/A'
                )
              );
            }
          );
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

  Receita({
    required this.nome, 
    required this.dificuldade,
    required this.tempoPreparo,
    required this.ingredientes,
    required this.modoPreparo
    });
}
