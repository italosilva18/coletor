import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget {
  final CollectionReference cadastrosSemanaRef =
      FirebaseFirestore.instance.collection('cadastrosSemana');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meta Cumprida'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Gráfico de Progresso'),
            ElevatedButton(
              child: Text('Ver Cadastros da Semana'),
              onPressed: () {
                Navigator.pushNamed(context, '/cadastros_semana');
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
        currentIndex: 0,
        backgroundColor: Colors.blueGrey,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
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
