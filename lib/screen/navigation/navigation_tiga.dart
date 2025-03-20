import 'package:flutter/material.dart';

class NavigationTiga extends StatelessWidget {
  const NavigationTiga({super.key});

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
                // controller: niali2,
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
                onPressed: () {},
                child: const Text('Hitung & Tutup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
