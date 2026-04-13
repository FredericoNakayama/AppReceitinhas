import 'package:flutter/material.dart';
import 'screens/tela_inicial.dart';

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