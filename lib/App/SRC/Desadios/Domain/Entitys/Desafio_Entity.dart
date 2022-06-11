import 'dart:io';

class DesafioEntity {
  final String imageUrl;
  final String titulo;
  final String tag;
  final String regras;
  final int duration;
  final bool ativo;
  final DateTime prozo;
  final String user;
  DesafioEntity(
      {required this.imageUrl,
      required this.titulo,
      required this.tag,
      required this.regras,
      required this.duration,
      required this.ativo,
      required this.prozo,
      required this.user});
}

class DesafioFrom {
  final File? image;
  final String titulo;
  final bool ativo;
  final int duration;
  final String listDeRegras;
  final String tag;
  final String usuario;

  const DesafioFrom({
    required this.ativo,
    required this.image,
    required this.titulo,
    required this.tag,
    required this.listDeRegras,
    required this.duration,
    required this.usuario,
  });
}
