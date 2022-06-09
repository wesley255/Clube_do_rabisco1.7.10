import 'dart:io';

class DesafioEntity {
  final String imageUrl;
  final String titulo;
  final String tag;
  final String regras;
  final DateTime dataLimite;
  DesafioEntity({
    required this.imageUrl,
    required this.titulo,
    required this.tag,
    required this.regras,
    required this.dataLimite,
  });
}

class DesafioFrom {
  final File image;
  final String titulo;
  final DateTime dataLimite;
  final String listDeRegras;
  final String tag;
  const DesafioFrom({
    required this.image,
    required this.titulo,
    required this.tag,
    required this.listDeRegras,
    required this.dataLimite,
  });
}
