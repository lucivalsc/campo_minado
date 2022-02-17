import 'package:flutter/material.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:lottie/lottie.dart';

class CampoWidget extends StatelessWidget {
  final Campo campo;
  final void Function(Campo) onAbrir;
  final void Function(Campo) onalternarMarcacao;
  const CampoWidget({
    Key? key,
    required this.campo,
    required this.onAbrir,
    required this.onalternarMarcacao,
  }) : super(key: key);

  Widget _getImage() {
    int qtdeMinas = campo.qtdeMinasNaVizinhaca;
    if (campo.aberto && campo.minado && campo.explodido) {
      return Lottie.asset('assets/skull.json');
    } else if (campo.aberto && campo.minado) {
      // return Image.asset('assets/images/bomba_1.jpeg');
      return Lottie.asset('assets/skull.json');
    } else if (campo.aberto) {
      return Image.asset('assets/images/aberto_$qtdeMinas.jpeg');
    } else if (campo.marcado) {
      return Image.asset('assets/images/bandeira.jpeg');
    } else {
      return Image.asset('assets/images/fechado.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onAbrir(campo),
      onLongPress: () => onalternarMarcacao(campo),
      child: _getImage(),
    );
  }
}
