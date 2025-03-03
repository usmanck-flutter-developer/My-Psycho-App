import 'package:flutter/material.dart';
import 'package:my_psychic_app/UI/main_screen.dart';

void main() {
  runApp(PsychicApp());
}

class PsychicApp extends StatelessWidget {
  const PsychicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Psychic App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.deepPurple.shade50,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.purple,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
        ),
      ),
      home: MainScreen(),
    );
  }
}
