import 'package:flutter/material.dart';

class QRCode extends StatelessWidget {
  const QRCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "QRCode",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.grey[100],
          elevation: 0.3),
      body: Container(),
    );
  }
}
