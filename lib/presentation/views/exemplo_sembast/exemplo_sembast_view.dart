import 'package:flutter/material.dart';

class ExemploSembast extends StatefulWidget {
  final String title = 'ExemploSembast';

  const ExemploSembast({super.key});

  @override
  ExemploSembastState createState() => ExemploSembastState();
}

class ExemploSembastState extends State<ExemploSembast> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExemploSembast'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
