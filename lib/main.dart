import 'package:flutter/material.dart';
import 'components/login.dart';

void main() {
  runApp(const EleganceApp());
}

class EleganceApp extends StatelessWidget {
  const EleganceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elegance',

      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE91E73),
        ),

        scaffoldBackgroundColor: const Color(0xFFF8F3F5),
      ),

      home: const LoginPage(),
    );
  }
}
