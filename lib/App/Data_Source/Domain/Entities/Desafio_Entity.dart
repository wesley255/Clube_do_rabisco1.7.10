import 'dart:io';

class DesafioEntity {
  final String url;
  final String titulo;
  final DateTime dataLimite;
  final List<String> listDeRegras;
  final String tag;
  const DesafioEntity({
    required this.tag,
    required this.listDeRegras,
    required this.url,
    required this.dataLimite,
    required this.titulo,
  });
}

class DesafioForm {
  final File image;
  final String titulo;
  final DateTime dataLimite;
  final List<String> listDeRegras;
  final String tag;
  const DesafioForm({
    required this.tag,
    required this.listDeRegras,
    required this.image,
    required this.dataLimite,
    required this.titulo,
  });
}
