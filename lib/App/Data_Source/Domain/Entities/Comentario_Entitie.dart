import 'package:flutter/cupertino.dart';

class ComentariosForm {
  String comentario;
  String userEmail;
  DateTime data;
  String postId;
  Color color;

  ComentariosForm({
    required this.color,
    required this.data,
    required this.comentario,
    required this.userEmail,
    required this.postId,
  });
}
