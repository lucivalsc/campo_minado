import 'package:campo_minado/components/botao_widget.dart';
import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        elevation: 0,
        title: const Text('Campo minado'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            BotaoWidget(texto: 'Fácil', qtdeDados: 6),
            BotaoWidget(texto: 'Médio', qtdeDados: 10),
            BotaoWidget(texto: 'Difícil', qtdeDados: 14),
          ],
        ),
      ),
    );
  }
}
