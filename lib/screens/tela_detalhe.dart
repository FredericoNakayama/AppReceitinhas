import 'package:flutter/material.dart';
import '../models/receita.dart';

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
                Text(receita.porcoes),
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
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              receita.modoPreparo,
              style: TextStyle(fontSize: 16, height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}