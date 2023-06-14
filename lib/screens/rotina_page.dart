import 'package:flutter/material.dart';

class RotinaPage extends StatefulWidget {
  @override
  _RotinaPageState createState() => _RotinaPageState();
}

class _RotinaPageState extends State<RotinaPage> {
  List<String> _treinos = [
    'Treino A',
    'Treino B',
    'Treino C',
  ];

  String _treinoSelecionado = '';

  void _selecionarTreino(String treino) {
    setState(() {
      _treinoSelecionado = treino;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rotina'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Selecione o Treino:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            DropdownButton<String>(
              value: _treinoSelecionado,
              onChanged: (String? novoTreino) {
                _selecionarTreino(novoTreino!);
              },
              items: _treinos.map((String treino) {
                return DropdownMenuItem<String>(
                  value: treino,
                  child: Text(treino),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text(
              'Dia Atual:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Segunda-feira',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implementar ação do botão para registrar a rotina
              },
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
