// main.dart
import 'package:flutter/material.dart';

import 'home.dart';
import 'layanan.dart';
import 'login.dart';
import 'maps.dart';
import 'news.dart';
import 'profil.dart';
import 'register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Routes Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 48, 4, 124)),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/': (context) => const HomePage(),
        '/news': (context) => const NewsPage(),
        '/maps': (context) => const MapsPage(),
        '/layanan': (context) => const LayananPage(),
        '/profil': (context) => const ProfilPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
      },
    );
  }
}