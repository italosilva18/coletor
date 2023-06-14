import 'package:flutter/material.dart';

class CadastroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navegar para a página de adicionar treino
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AdicionarTreinoPage()),
            );
          },
          child: Text('Adicionar Treino'),
        ),
      ),
    );
  }
}

class AdicionarTreinoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Treino'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navegar para a página de adicionar exercício
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AdicionarExercicioPage()),
            );
          },
          child: Text('Adicionar Exercício'),
        ),
      ),
    );
  }
}

class AdicionarExercicioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Exercício'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Nome do Exercício',
            ),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Quantidade de Séries',
            ),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Quantidade de Repetições',
            ),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Peso',
            ),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Tempo de Descanso em Segundos',
            ),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Observação sobre o Movimento',
            ),
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              labelText: 'Inserção de Imagem',
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Implementar ação do botão para adicionar o exercício
            },
            child: Text('Adicionar'),
          ),
        ],
      ),
    );
  }
}
