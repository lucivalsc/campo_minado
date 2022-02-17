import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:campo_minado/components/resultado_widget.dart';
import 'package:campo_minado/components/tabuleiro_widget.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/explosao_exception.dart';
import 'package:campo_minado/models/tabuleiro.dart';

class CampoMinadoApp extends StatefulWidget {
  final int qtdeDados;

  const CampoMinadoApp({
    Key? key,
    required this.qtdeDados,
  }) : super(key: key);

  @override
  State<CampoMinadoApp> createState() => _CampoMinadoAppState();
}

class _CampoMinadoAppState extends State<CampoMinadoApp> {
  bool? _venceu;
  int vitorias = 0;
  int derrotas = 0;

  Tabuleiro? _tabuleiro;

  void _reiniciar() {
    setState(() {
      try {
        _venceu = null;
        _tabuleiro!.reiniciar();
      } on ExplosaoException {}
    });
  }

  void _onAbrir(Campo c) {
    if (_venceu != null) {
      return;
    }
    setState(() {
      try {
        c.abrir();
        if (_tabuleiro!.resolvido) {
          _venceu = true;
          vitorias++;
        }
      } on ExplosaoException {
        _venceu = false;
        derrotas++;
        _tabuleiro!.revelarBombas();
      }
    });
  }

  void _onalternarMarcacao(Campo c) {
    if (_venceu != null) {
      return;
    }
    setState(() {
      try {
        c.alternarMarcacao();
        if (_tabuleiro!.resolvido) {
          _venceu = true;
        }
      } on ExplosaoException {}
    });
  }

  Tabuleiro _getTabuleiro(double largura, double altura) {
    if (_tabuleiro == null) {
      int qtdeColunas = widget.qtdeDados;

      _tabuleiro = Tabuleiro(
        linhas: widget.qtdeDados,
        colunas: qtdeColunas,
        qtdeBombas: widget.qtdeDados,
      );
    }
    return _tabuleiro!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResultadoWidget(
        venceu: _venceu,
        onReiniciar: _reiniciar,
      ),
      body: Column(
        children: [
          const SizedBox(height: 25),
          widget.qtdeDados > 0
              ? _venceu == true
                  ? Center(child: Lottie.asset('assets/vitoria.json'))
                  : Center(
                      child: SizedBox(
                        width: 350,
                        height: 350,
                        child: LayoutBuilder(
                          builder: (ctx, constraints) {
                            return TabuleiroWidget(
                                tabuleiro: _getTabuleiro(
                                  constraints.maxWidth,
                                  constraints.maxHeight,
                                ),
                                onAbrir: _onAbrir,
                                onalternarMarcacao: _onalternarMarcacao);
                          },
                        ),
                      ),
                    )
              : const Text('Clique no nível de dificuldade.'),
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Vitórias: $vitorias'),
          Text('Derrotas: $derrotas'),
        ],
      ),
    );
  }
}
