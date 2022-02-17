import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ResultadoWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool? venceu;
  final Function()? onReiniciar;
  const ResultadoWidget({
    Key? key,
    required this.venceu,
    required this.onReiniciar,
  }) : super(key: key);

  Color _getCor() {
    if (venceu == null) {
      return Colors.yellow;
    } else if (venceu!) {
      return Colors.green.shade300;
    } else {
      return Colors.red.shade300;
    }
  }

  LottieBuilder _getImage() {
    if (venceu == null) {
      return Lottie.asset('assets/iniciar.json');
    } else if (venceu!) {
      return Lottie.asset('assets/inicio.json');
    } else {
      return Lottie.asset('assets/choro.json');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
              ),
              CircleAvatar(
                backgroundColor: _getCor(),
                child: InkWell(
                  onTap: onReiniciar,
                  child: _getImage(),
                ),
              ),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
