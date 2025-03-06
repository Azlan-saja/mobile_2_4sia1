import 'package:flutter/material.dart';
import 'package:master/screen/navigation/navigation_dua.dart';
import 'package:master/screen/navigation/navigation_satu.dart';
import 'package:master/screen/navigation/navigation_tiga.dart';

class Navigation extends StatelessWidget {
  final data = TextEditingController();
  Navigation({super.key});

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
                    builder: (context) => const NavigationSatu(
                      nama: 'AzlansajaTV',
                    ),
                  ),
                );
              },
              child: const Text('Kirim Data'),
            ),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NavigationDua(),
                  ),
                );
                (result != null) ? data.text = result : data.clear();
              },
              child: const Text('Terima Data'),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(),
              child: TextFormField(
                controller: data,
                maxLength: 20,
                decoration: const InputDecoration(
                  labelText: 'Terima Data',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  helperText: "Datanya apa ya?",
                ),
                onChanged: (value) {},
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NavigationTiga(),
                  ),
                );
              },
              child: const Text('Kirim Serta Terima Data'),
            ),
          ],
        ),
      ),
    );
  }
}
