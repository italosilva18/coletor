import 'package:flutter/material.dart';
import 'package:registrafit/screens/registro_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro de Atividades Físicas',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: RegistroScreen(),
    );
  }
}
