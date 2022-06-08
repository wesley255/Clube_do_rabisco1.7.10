import 'package:testes_de_estudos/App/Data_Source/Domain/Entities/Comentario_Entitie.dart';

abstract class UserDatasouceActionContract {
  Future<void> darlike(String postId, String userEmail);
  Future<void> tirarlike(String postId, String userEmail);
  Future<void> comentar({required ComentariosForm comentariosForm});
  Future<void> inicializeListComentarios(String postId);
  Future<void> obseverListComentarios(String postId);
}
