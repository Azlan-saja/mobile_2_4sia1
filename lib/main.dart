import 'package:flutter/material.dart';
import 'package:master/screen/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Quicksand',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.orange,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.yellow[500],
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          elevation: 0,
        ),
      ),
      home: const Dashboard(),
    );
  }
}
