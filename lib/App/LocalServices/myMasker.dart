import 'package:flutter/material.dart';

class MaskTextFormField extends StatelessWidget {
  final String prefixo;
  final String formatText;
  TextEditingController textController;
  MaskTextFormField({
    required this.prefixo,
    required this.formatText,
    required this.textController,
  });
  int _cacheTextlength = 0;
  void _format(String texto) {
    /*----------\/-[Cache]-\/----------*/
    bool delete = texto.length < _cacheTextlength;
    _cacheTextlength = texto.length;
    int index = 0;
    if (texto.isNotEmpty) {
      index = texto.length - 1;
    }
    /*----------\/-[verificação]-\/----------*/
    if (formatText[index] != prefixo && !delete) {
      /*----------\/-[formatação do texto]-\/----------*/
      String edditText = texto.substring(0, texto.length - 1);
      edditText = edditText + formatText[index];
      edditText = edditText + texto.substring(texto.length - 1);
      /*----------\/-[resultado]-\/----------*/
      textController.text = edditText;
      textController.selection = TextSelection.fromPosition(
        TextPosition(offset: textController.text.length),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      maxLength: formatText.length,
      keyboardType: TextInputType.number,
      onChanged: (texto) {
        _format(texto);
      },
    );
  }
}
