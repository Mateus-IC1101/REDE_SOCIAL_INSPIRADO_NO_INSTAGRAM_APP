import 'package:flutter/material.dart';
import 'package:rede_social_app/pages/chat_page.dart';
import 'package:rede_social_app/pages/home_page.dart';
import 'package:rede_social_app/pages/login_page.dart';
import 'package:rede_social_app/pages/pesquisa_page.dart';
import 'package:rede_social_app/pages/profile_page.dart';
import 'package:rede_social_app/pages/seguidores_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const LoginPage(),
      // HomePage(),
      routes: {
        '/home': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
        '/pesquisa': (context) => PesquisaPage(),
        '/seguidores': (context) => SeguidoresPage(),
        '/chat': (context) => ChatPage(),
      },
    );
  }
}
