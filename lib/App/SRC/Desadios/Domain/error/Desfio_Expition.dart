class DesafioExpition implements Exception {
  final String? url;
  final String? titulo;
  final String? dataLimite;
  final String? listDeRegras;
  final String? tag;
  const DesafioExpition({
    this.tag,
    this.listDeRegras,
    this.url,
    this.dataLimite,
    this.titulo,
  });
}
