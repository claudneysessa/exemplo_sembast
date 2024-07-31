import 'package:exemplo_sembast/presentation/views/exemplo_sembast/exemplo_sembast_view.dart';
import 'package:flutter/material.dart';

class ApplicationWidget extends StatefulWidget {
  final String title = 'ApplicationWidget';

  const ApplicationWidget({super.key});

  @override
  ApplicationWidgetState createState() => ApplicationWidgetState();
}

class ApplicationWidgetState extends State<ApplicationWidget> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExemploSembast(),
    );
  }
}
