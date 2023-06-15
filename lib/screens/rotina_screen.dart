import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RotinaScreen extends StatefulWidget {
  @override
  _RotinaScreenState createState() => _RotinaScreenState();
}

class _RotinaScreenState extends State<RotinaScreen> {
  final CollectionReference treinosRef =
      FirebaseFirestore.instance.collection('treinos');

  String? selectedTreino;

  void selectTreino(String treinoId) {
    setState(() {
      selectedTreino = treinoId;
    });
  }

  void salvarTreinoDiaAtual() {
    // Implemente o código para salvar o treino selecionado no dia atual
    if (selectedTreino != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Treino salvo com sucesso')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Selecione um treino')),
      );
    }
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
          children: [
            Text(
              'Selecione o treino do dia:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            StreamBuilder<QuerySnapshot>(
              stream: treinosRef.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Erro: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }

                return ListView(
                  shrinkWrap: true,
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data() as Map<String, dynamic>;

                    return ListTile(
                      title: Text(data['nome']),
                      onTap: () {
                        selectTreino(document.id);
                      },
                      selected: document.id == selectedTreino,
                      tileColor:
                          document.id == selectedTreino ? Colors.blue : null,
                    );
                  }).toList(),
                );
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Salvar Treino'),
              onPressed: () {
                salvarTreinoDiaAtual();
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
        currentIndex: 2,
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
