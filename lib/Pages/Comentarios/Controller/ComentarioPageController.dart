import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:testes_de_estudos/App/Data_Source/Domain/Entities/Comentario_Entitie.dart';
import 'package:testes_de_estudos/App/Data_Source/Domain/User_Actions_Datasorce_UserCase.dart';
import 'package:testes_de_estudos/App/Services/AppInstances.dart';
import 'package:testes_de_estudos/App/Widgets/RandomColor.dart';

part 'ComentarioPageController.g.dart';

class ComentarioPageController = _ComentarioPageController
    with _$ComentarioPageController;

abstract class _ComentarioPageController with Store {
  final UserActionUsecase userActions = AppSevices.userActions;
  ObservableMap<String, ComentariosForm> mapListComentarios = ObservableMap();
  @computed
  List<ComentariosForm> get getlistComentarios =>
      mapListComentarios.values.toList();
  @action
  void dispose() {
    mapListComentarios.clear();
  }

  @observable
  TextEditingController controller = TextEditingController();

  Future<void> comentar({
    required String comentario,
    required String postid,
  }) async {
    await userActions.comentar(
      comentariosForm: ComentariosForm(
        color: RandomColor(maxSaturasao: 200, minSaturasoa: 100).call(),
        data: DateTime.now(),
        comentario: comentario,
        userEmail: AppSevices.appController.getMyUser().email,
        postId: postid,
      ),
    );
  }

  Future<void> inicalizeListPost(String postid) async {
    await userActions.inicializeListComentarios(postid);
  }
}
