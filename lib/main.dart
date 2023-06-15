import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:registrafit/firebase_options.dart';
import 'package:registrafit/screens/home_screen.dart';
import 'package:registrafit/screens/cadastro_screen.dart';
import 'package:registrafit/screens/rotina_screen.dart';
import 'package:registrafit/screens/configuracoes_screen.dart';
import 'package:registrafit/screens/cadastros_semana_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/cadastro': (context) => CadastroScreen(),
        '/rotina': (context) => RotinaScreen(),
        '/configuracoes': (context) => ConfiguracoesScreen(),
        '/cadastrosSemana': (context) => CadastrosSemanaScreen(),
      },
    );
  }
}
