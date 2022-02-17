import 'package:campo_minado/components/campo_widget.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:flutter/material.dart';
import 'package:campo_minado/models/tabuleiro.dart';

class TabuleiroWidget extends StatelessWidget {
  final Tabuleiro tabuleiro;
  final void Function(Campo) onAbrir;
  final void Function(Campo) onalternarMarcacao;
  const TabuleiroWidget({
    Key? key,
    required this.tabuleiro,
    required this.onAbrir,
    required this.onalternarMarcacao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: tabuleiro.colunas,
      children: tabuleiro.campos.map(
        (c) {
          return CampoWidget(
            campo: c,
            onAbrir: onAbrir,
            onalternarMarcacao: onalternarMarcacao,
          );
        },
      ).toList(),
    );
  }
}
