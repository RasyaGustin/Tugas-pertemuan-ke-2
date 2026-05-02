import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ganjil Genap',
      home: CekBilangan(),
    );
  }
}

class CekBilangan extends StatefulWidget {
  @override
  _CekBilanganState createState() => _CekBilanganState();
}

class _CekBilanganState extends State<CekBilangan> {
  final TextEditingController _controller = TextEditingController();
  String _hasil = "";
  Color _warna = Colors.black;

  String cekGanjilGenap(int angka) {
    return (angka % 2 == 0) ? "Genap" : "Ganjil";
  }

  void proses() {
    if (_controller.text.isEmpty) {
      setState(() {
        _hasil = "Input tidak boleh kosong";
        _warna = Colors.red;
      });
      return;
    }

    int? angka = int.tryParse(_controller.text);

    if (angka == null) {
      setState(() {
        _hasil = "Input harus angka";
        _warna = Colors.red;
      });
      return;
    }

    setState(() {
      _hasil = cekGanjilGenap(angka);
      _warna = Colors.green;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cek Ganjil Genap")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Masukkan angka"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: proses,
              child: Text("Cek"),
            ),
            SizedBox(height: 20),
            Text(
              _hasil,
              style: TextStyle(fontSize: 20, color: _warna),
            )
          ],
        ),
      ),
    );
  }
}