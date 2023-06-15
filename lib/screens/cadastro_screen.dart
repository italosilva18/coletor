import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final TextEditingController _nomeTreinoController = TextEditingController();
  final CollectionReference treinosRef =
      FirebaseFirestore.instance.collection('treinos');

  @override
  void dispose() {
    _nomeTreinoController.dispose();
    super.dispose();
  }

  void adicionarTreino() {
    String nomeTreino = _nomeTreinoController.text;

    if (nomeTreino.isNotEmpty) {
      treinosRef.add({
        'nome': nomeTreino,
      }).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Treino adicionado com sucesso')),
        );
        _nomeTreinoController.clear();
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao adicionar o treino')),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeTreinoController,
              decoration: InputDecoration(labelText: 'Nome do Treino'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Adicionar Treino'),
              onPressed: () {
                adicionarTreino();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Cadastro',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Rotina',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/');
              break;
            case 1:
              Navigator.pushNamed(context, '/cadastro');
              break;
            case 2:
              Navigator.pushNamed(context, '/rotina');
              break;
            case 3:
              Navigator.pushNamed(context, '/configuracoes');
              break;
          }
        },
      ),
    );
  }
}
