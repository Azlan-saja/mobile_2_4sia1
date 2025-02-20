import 'package:flutter/material.dart';
import 'package:master/screen/navigation/navigation_satu.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layar Navigation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NavigationSatu(),
                  ),
                );
              },
              child: const Text('Navigation 1'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Navigation 2'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Navigation 3'),
            ),
          ],
        ),
      ),
    );
  }
}
