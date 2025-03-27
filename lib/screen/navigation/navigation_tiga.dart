import 'package:flutter/material.dart';

class NavigationTiga extends StatelessWidget {
  final int nilai1;

  NavigationTiga({super.key, required this.nilai1});

  final nilai2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kirim & Terima Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                initialValue: nilai1.toString(),
                maxLength: 2,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Nilai 1',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  helperText: "Data dari layar navigation!",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                ),
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: nilai2,
                keyboardType: TextInputType.number,
                maxLength: 2,
                decoration: const InputDecoration(
                  labelText: 'Nilai 2',
                  labelStyle: TextStyle(
                    color: Colors.blueGrey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  helperText: "Silahkan input nilai 2 sekarang!",
                ),
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (nilai2.text != '') {
                    int penjumlahan = nilai1 + int.parse(nilai2.text);
                    Navigator.pop(context, {
                      'nilai1': nilai1,
                      'nilai2': nilai2.text,
                      'hasil': penjumlahan,
                    });
                  }
                },
                child: const Text('Hitung & Tutup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
