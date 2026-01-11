import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = true;
  String message = 'Đang gọi API...';
  String? error;

  @override
  void initState() {
    super.initState();
    fetchFromBE();
  }

  Future<void> fetchFromBE() async {
    try {
      // Android Emulator gọi Spring Boot local (máy tính) qua 10.0.2.2
      final url = Uri.parse('http://10.0.2.2:8080/api/test/hello');

      final res = await http.get(url);

      if (res.statusCode == 200) {
        final json = jsonDecode(res.body) as Map<String, dynamic>;
        setState(() {
          message = (json['message'] ?? '').toString();
          loading = false;
        });
      } else {
        setState(() {
          error = 'HTTP ${res.statusCode}: ${res.body}';
          loading = false;
        });
      }
    } catch (e) {
      setState(() {
        error = 'Lỗi mạng: $e';
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Flutter ↔ Spring Boot')),
        body: Center(
          child: loading
              ? const CircularProgressIndicator()
              : (error != null
              ? Padding(
            padding: const EdgeInsets.all(16),
            child: Text(error!, textAlign: TextAlign.center),
          )
              : Padding(
            padding: const EdgeInsets.all(16),
            child: Text(message, textAlign: TextAlign.center),
          )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              loading = true;
              error = null;
              message = 'Đang gọi API...';
            });
            fetchFromBE();
          },
          child: const Icon(Icons.refresh),
        ),
      ),
    );
  }
}
