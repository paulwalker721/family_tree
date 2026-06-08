import 'package:family_tree/family_tree_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Family Tree',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2F7D7E)),
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const FamilyTreeScreen(),
    );
  }
}
