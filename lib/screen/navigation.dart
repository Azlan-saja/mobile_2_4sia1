import 'package:flutter/material.dart';
import 'package:master/screen/navigation/navigation_dua.dart';
import 'package:master/screen/navigation/navigation_satu.dart';
import 'package:master/screen/navigation/navigation_tiga.dart';

class Navigation extends StatelessWidget {
  Navigation({super.key});

  final data = TextEditingController();
  final kirimNilai1 = TextEditingController();

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
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                readOnly: true,
                controller: data,
                maxLength: 20,
                decoration: const InputDecoration(
                  labelText: 'Terima Data',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  helperText: "Datanya apa ya?",
                ),
                onChanged: (value) {},
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 2,
                decoration: const InputDecoration(
                  labelText: 'Kirim Nilai 1',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  helperText: "Silahkan input nilai 1 sekarang!",
                ),
                controller: kirimNilai1,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavigationTiga(
                        nilai1: int.tryParse(kirimNilai1.text) ?? 0),
                  ),
                );

                if (result != null) {
                  if (!context.mounted) return;
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(
                            '${result['nilai1']} + ${result['nilai2']} = ${result['hasil']}'),
                        actions: [
                          TextButton(
                            child: const Text('Keluar'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Kirim Serta Terima Data'),
            ),
          ],
        ),
      ),
    );
  }
}
