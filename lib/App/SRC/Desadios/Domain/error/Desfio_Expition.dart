class DesafioExpition implements Exception {
  final String? url;
  final String? titulo;
  final String? duration;
  final String? listDeRegras;
  final String? tag;
  final String? ativo;
  const DesafioExpition(
      {this.tag,
      this.listDeRegras,
      this.url,
      this.duration,
      this.titulo,
      this.ativo});
}
