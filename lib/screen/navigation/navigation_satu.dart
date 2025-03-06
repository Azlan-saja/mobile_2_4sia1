import 'package:flutter/material.dart';

class NavigationSatu extends StatelessWidget {
  final String nama;

  const NavigationSatu({super.key, required this.nama});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kirim Data'),
      ),
      body:      Center(
        child: Text('Hei Kawan. Nama saya $nama'),
      ),
    );
  }
}
