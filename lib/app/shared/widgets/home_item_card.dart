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
        color: azulCinza,
        child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 60,
                  child: Image.asset(
                    imagem,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                    flex: 5,
                    child: Container(
                        //color: Colors.amber,
                        )),
                Expanded(
                    flex: 35,
                    child: Container(
                      alignment: Alignment.center,
                      //color: Colors.red,
                      child: Text(
                        titulo,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}
