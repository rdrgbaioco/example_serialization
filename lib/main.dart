import 'package:flutter/material.dart';
import 'package:example_serialization/source/view/home.dart';

void main() {
  runApp(const SerializationApp());
}

class SerializationApp extends StatelessWidget {
  const SerializationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeApp(),
    );
  }
}
