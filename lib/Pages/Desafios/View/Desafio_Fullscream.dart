import 'package:flutter/material.dart';
import 'package:testes_de_estudos/App/Widgets/Cards/Card_Desafio.dart';
import 'package:testes_de_estudos/App/src/Desadios/Domain/Entitys/Desafio_Entity.dart';

class ShowDesafio {
  Future<void> showDesafio({
    required DesafioEntity desafio,
    required BuildContext context,
  }) async {
    return showDialog<void>(
      barrierColor: Color.fromRGBO(13, 13, 13, 0.9),
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return DesafilCard(
          fullScrean: true,
          desafio: desafio,
        );
      },
    );
  }
}
