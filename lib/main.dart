import 'package:campo_minado/screens/campo_minado_app.dart';
import 'package:campo_minado/screens/principal.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyHome());

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Principal(),
    );
  }
}
