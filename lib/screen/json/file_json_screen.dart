import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FileJsonScreen extends StatefulWidget {
  const FileJsonScreen({super.key});

  @override
  State<FileJsonScreen> createState() => _FileJsonScreenState();
}

class _FileJsonScreenState extends State<FileJsonScreen> {
  final jamController = TextEditingController();
  final pelajaranController = TextEditingController();

  List<Map<String, dynamic>> roster = [];

  readRoster() async {
    final isiFile = await rootBundle.loadString('assets/roster.json');
    roster = List<Map<String, dynamic>>.from(jsonDecode(isiFile));
    setState(() {});
  }

  createRoster() {
    if (jamController.text.isEmpty || pelajaranController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Data tidak boleh kosong.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      );
    } else {
      roster.add({
        'id': roster.isEmpty ? 1 : roster.last['id'] + 1,
        'jam': jamController.text,
        'pelajaran': pelajaranController.text,
      });
      jamController.clear();
      pelajaranController.clear();
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          content: const Text(
            'Simpan berhasil.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      );
    }
  }

  deleteRoster(int id) {
    roster.removeWhere((data) => data['id'] == id);
    setState(() {});
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        content: const Text(
          'Hapus berhasil.',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    readRoster();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Layar File JSON"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            TextFormField(
              controller: jamController,
              onTap: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                ).then(
                  (value) {
                    if (value != null) {
                      if (!context.mounted) return;
                      jamController.text = value.format(context);
                    }
                  },
                );
              },
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Jam Masuk',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: pelajaranController,
              decoration: const InputDecoration(
                labelText: 'Mata Pelajaran',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      createRoster();
                    },
                    child: const Text('Simpan')),
                ElevatedButton(onPressed: () {}, child: const Text('Batal')),
              ],
            ),
            Divider(
              color: Theme.of(context).appBarTheme.backgroundColor,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: roster.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          Theme.of(context).appBarTheme.backgroundColor,
                      child: Text(
                        "${index + 1}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    title: Text(
                      roster[index]["jam"],
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      roster[index]["pelajaran"],
                      style: TextStyle(
                          color: Theme.of(context).appBarTheme.backgroundColor,
                          fontStyle: FontStyle.italic),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.edit,
                          size: 30,
                          color: Colors.green,
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          onPressed: () {
                            deleteRoster(roster[index]["id"]);
                          },
                          icon: const Icon(
                            Icons.delete,
                            size: 30,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
