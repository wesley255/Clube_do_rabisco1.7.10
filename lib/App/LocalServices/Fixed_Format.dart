import 'package:flutter/cupertino.dart';

class FixedFormat {
  static prefixoTextController({
    required TextEditingController controller,
    required String prefixo,
  }) {
    bool isAddPrefixo = false;
    /*------[validação]-------*/
    if (controller.text.length == 1) {
      isAddPrefixo = true;
      controller.text[0] != prefixo[0]
          ? isAddPrefixo = true
          : isAddPrefixo = false;
    }
    /*------[add Prefixo]-------*/
    if (isAddPrefixo) {
      String value = controller.text;
      controller.text = '$prefixo$value';
      controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length),
      );
      /*------[return with Prefixo]-------*/

      return controller;
    } else {
      /*------[return with not Prefixo]-------*/
      return controller;
    }
  }

  static TextEditingController multeLineTexControllerPrefix({
    required TextEditingController controller,
    required int lines,
    required String prefixo,
  }) {
    /*--------[cache]--------*/
    print(controller.text);
    List<String> listTexte = controller.text.split('\n');
    List<String> newListTexte = [];
    /*--------[verificaçães]---------*/

    if (controller.text.length == 1) {
      if (controller.text[0] != prefixo[0]) {
        controller.text = prefixo + controller.text;
      }
    } else if (listTexte.length > lines) {
      for (var element in listTexte) {
        if (element.isEmpty) {
          /*--------[new line]---------*/
          newListTexte.add(prefixo);
        } else if (element.length >= prefixo.length) {
          /*--------[line sem prefixo]---------*/
          if (element.substring(0, prefixo.length) !=
              prefixo.substring(0, prefixo.length)) {
            if (element[0] == prefixo[0]) {
              newListTexte.add(prefixo + element.substring(1, element.length));
            } else {
              newListTexte.add(prefixo + element);
            }
          } else {
            newListTexte.add(element);
          }
        }
      }
      /*--------[empacotando dados]---------*/
      String newTexto = newListTexte.join('\n');
      controller.text = newTexto;
      controller.selection = TextSelection(
        baseOffset: newTexto.length,
        extentOffset: newTexto.length,
      );
    }
    /*--------[retorno]---------*/
    return controller;
  }
}
