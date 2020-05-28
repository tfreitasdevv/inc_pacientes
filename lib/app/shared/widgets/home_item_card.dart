import 'package:flutter/material.dart';
import 'package:incpacientes/app/shared/constants.dart';

class HomeItemCard extends StatelessWidget {
  final String titulo;
  final String imagem;
  final Function funcao;

  const HomeItemCard(
      {Key key,
      @required this.titulo,
      @required this.imagem,
      @required this.funcao})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: pretoLogo,
        child: Image.asset(imagem),
      ),
    );
  }
}
