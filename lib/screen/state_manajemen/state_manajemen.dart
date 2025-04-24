import 'package:flutter/material.dart';

class StateManajemen extends StatefulWidget {
  const StateManajemen({super.key});

  @override
  State<StateManajemen> createState() => _StateManajemenState();
}

class _StateManajemenState extends State<StateManajemen> {
  int valueCounter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Layar State Manajemen')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    valueCounter--; //valueCounter = valueCounter-1;
                  });
                },
                child: const Text('-1')),
            Text('$valueCounter', style: const TextStyle(fontSize: 37)),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    valueCounter++;
                  });
                },
                child: const Text('+1')),
          ],
        ),
      ),
    );
  }
}
