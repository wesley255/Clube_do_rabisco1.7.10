class Post {
  final String user;
  final String label;
  final DateTime data;
  final List image;
  final List favorios;
  final int nComentarios;
  final String id;

  Post({
    required this.id,
    required this.user,
    required this.label,
    required this.data,
    required this.image,
    required this.favorios,
    required this.nComentarios,
  });
}
