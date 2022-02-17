import 'package:flutter/material.dart';
import 'package:campo_minado/screens/campo_minado_app.dart';

class BotaoWidget extends StatelessWidget {
  final String texto;
  final int qtdeDados;
  const BotaoWidget({
    Key? key,
    required this.texto,
    required this.qtdeDados,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.only(top: 25),
      child: ElevatedButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CampoMinadoApp(qtdeDados: qtdeDados),
          ),
        ),
        child: Text(texto),
        style: ElevatedButton.styleFrom(
          primary: Colors.grey,
        ),
      ),
    );
  }
}
