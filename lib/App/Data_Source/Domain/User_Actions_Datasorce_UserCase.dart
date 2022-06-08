import 'package:testes_de_estudos/App/Data_Source/Domain/Entities/Comentario_Entitie.dart';
import 'package:testes_de_estudos/App/Data_Source/Infra/DataSource/User_Action_contract.dart';

abstract class UserActionUsecase {
  Future<void> darlike({required String postId, required String userEmail});
  Future<void> tirarlike({required String postId, required String userEmail});
  Future<void> comentar({required ComentariosForm comentariosForm});
  Future<void> inicializeListComentarios(String postId);
}

class UserActionUsecaseImpl implements UserActionUsecase {
  final UserDatasouceActionContract userDatasorceActions;
  UserActionUsecaseImpl({required this.userDatasorceActions});
  @override
  Future<void> darlike({
    required String postId,
    required String userEmail,
  }) async {
    await userDatasorceActions.darlike(postId, userEmail);
  }

  @override
  Future<void> tirarlike({
    required String postId,
    required String userEmail,
  }) async {
    await userDatasorceActions.tirarlike(postId, userEmail);
  }

  @override
  Future<void> comentar({required ComentariosForm comentariosForm}) async {
    if (comentariosForm.comentario != '') {
      await userDatasorceActions.comentar(comentariosForm: comentariosForm);
    }
  }

  @override
  Future<void> inicializeListComentarios(String postId) async {
    await userDatasorceActions.inicializeListComentarios(postId);
  }
}
