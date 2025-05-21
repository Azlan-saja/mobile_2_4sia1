import 'package:flutter/material.dart';
import 'package:master/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class StateManajemen extends StatefulWidget {
  const StateManajemen({super.key});

  @override
  State<StateManajemen> createState() => _StateManajemenState();
}

class _StateManajemenState extends State<StateManajemen> {
  int valueCounter = 1;

  @override
  Widget build(BuildContext context) {
    final counterProvider =
        Provider.of<CounterProvider>(context, listen: false);
    // print("Cetak Layar State Manajemen.");
    return Scaffold(
      appBar: AppBar(title: const Text('Layar State Manajemen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Local State: SetState()',
              style: TextStyle(fontSize: 18),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        valueCounter--;
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
            const Divider(),
            const SizedBox(height: 60),
            const Text(
              'Global State: Package Provider',
              style: TextStyle(fontSize: 18),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      counterProvider.kurangkan();
                    },
                    child: const Text('-1')),
                Consumer<CounterProvider>(
                  builder: (_, value, __) {
                    // print("Cetak Hanya State Hasil.");
                    return Text(value.hasil,
                        style: const TextStyle(fontSize: 37));
                  },
                ),
                // Text(counterProvider.hasil,
                //     style: const TextStyle(fontSize: 37)),
                ElevatedButton(
                    onPressed: () {
                      counterProvider.tambahkan();
                    },
                    child: const Text('+1')),
              ],
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
