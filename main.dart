import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FizzBuzzPage(),
    );
  }
}

class FizzBuzzPage extends StatefulWidget {
  @override
  _FizzBuzzPageState createState() => _FizzBuzzPageState();
}

class _FizzBuzzPageState extends State<FizzBuzzPage> {
  final TextEditingController _controller = TextEditingController();
  String _hasil = "";
  String mode = "ganjilgenap";

  String fizzBuzz(int n) {
    if (n % 3 == 0 && n % 5 == 0) return "FizzBuzz";
    if (n % 3 == 0) return "Fizz";
    if (n % 5 == 0) return "Buzz";
    return n.toString();
  }

  String cekGanjilGenap(int n) {
    return (n % 2 == 0) ? "Genap" : "Ganjil";
  }

  void proses() {
    int? angka = int.tryParse(_controller.text);

    if (angka == null) {
      setState(() {
        _hasil = "Input tidak valid";
      });
      return;
    }

    setState(() {
      _hasil = (mode == "ganjilgenap")
          ? cekGanjilGenap(angka)
          : fizzBuzz(angka);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mode Pilihan')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButton<String>(
              value: mode,
              items: [
                DropdownMenuItem(
                  value: "ganjilgenap",
                  child: Text("Ganjil Genap"),
                ),
                DropdownMenuItem(
                  value: "fizzbuzz",
                  child: Text("FizzBuzz"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  mode = value!;
                });
              },
            ),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Masukkan angka"),
            ),
            ElevatedButton(
              onPressed: proses,
              child: Text("Proses"),
            ),
            SizedBox(height: 20),
            Text(_hasil, style: TextStyle(fontSize: 20))
          ],
        ),
      ),
    );
  }
}