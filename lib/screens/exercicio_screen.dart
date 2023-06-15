import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExercicioScreen extends StatefulWidget {
  final String treinoId;

  ExercicioScreen({required this.treinoId});

  @override
  _ExercicioScreenState createState() => _ExercicioScreenState();
}

class _ExercicioScreenState extends State<ExercicioScreen> {
  final TextEditingController _nomeExercicioController = TextEditingController();
  final TextEditingController _quantidadeSeriesController = TextEditingController();
  final TextEditingController _quantidadeRepeticoesController = TextEditingController();
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _tempoDescansoController = TextEditingController();
  final TextEditingController _observacaoController = TextEditingController();
  final TextEditingController _imagemController = TextEditingController();

  final CollectionReference exerciciosRef =
      FirebaseFirestore.instance.collection('exercicios');

  @override
  void dispose() {
    _nomeExercicioController.dispose();
    _quantidadeSeriesController.dispose();
    _quantidadeRepeticoesController.dispose();
    _pesoController.dispose();
    _tempoDescansoController.dispose();
    _observacaoController.dispose();
    _imagemController.dispose();
    super.dispose();
  }

  void adicionarExercicio() {
    String nomeExercicio = _nomeExercicioController.text;
    int quantidadeSeries = int.tryParse(_quantidadeSeriesController.text) ?? 0;
    int quantidadeRepeticoes =
        int.tryParse(_quantidadeRepeticoesController.text) ?? 0;
    double peso = double.tryParse(_pesoController.text) ?? 0.0;
    int tempoDescanso = int.tryParse(_tempoDescansoController.text) ?? 0;
    String observacao = _observacaoController.text;
    String imagem = _imagemController.text;

    if (nomeExercicio.isNotEmpty) {
      exerciciosRef.add({
        'treinoId': widget.treinoId,
        'nome': nomeExercicio,
        'series': quantidadeSeries,
        'repeticoes': quantidadeRepeticoes,
        'peso': peso,
        'descanso': tempoDescanso,
        'observacao': observacao,
        'imagem': imagem,
      }).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Exercício adicionado com sucesso')),
        );
        _nomeExercicioController.clear();
        _quantidadeSeriesController.clear();
        _quantidadeRepeticoesController.clear();
        _pesoController.clear();
        _tempoDescansoController.clear();
        _observacaoController.clear();
        _imagemController.clear();
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao adicionar o exercício')),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Exercício'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeExercicioController,
              decoration: InputDecoration(labelText: 'Nome do Exercício'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _quantidadeSeriesController,
              decoration: InputDecoration(labelText: 'Quantidade de Séries'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _quantidadeRepeticoesController,
              decoration: InputDecoration(labelText: 'Quantidade de Repetições'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _pesoController,
              decoration: InputDecoration(labelText: 'Peso (kg)'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _tempoDescansoController,
              decoration: InputDecoration(labelText: 'Tempo de Descanso (segundos)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _observacaoController,
              decoration: InputDecoration(labelText: 'Observação'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _imagemController,
              decoration: InputDecoration(labelText: 'URL da Imagem'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Adicionar Exercício'),
              onPressed: () {
                adicionarExercicio();
              },
            ),
          ],
        ),
      ),
    );
  }
}
