import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('Tela Inicial'),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Meta Cumprida',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Icon(
              Icons.check_circle,
              size: 64,
              color: Colors.green,
            ),
            SizedBox(height: 16),
            Text(
              'Mostrar todos os cadastros da semana',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implementar ação do botão para mostrar os cadastros da semana
              },
              child: Text('Mostrar'),
            ),
          ],
        ),
      ),
    );
  }
}
