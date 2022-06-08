// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Perfil_Store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PerfilStore on _Perfil_Store, Store {
  late final _$newBackgrandeImagePerfilAtom =
      Atom(name: '_Perfil_Store.newBackgrandeImagePerfil', context: context);

  @override
  LocalImage? get newBackgrandeImagePerfil {
    _$newBackgrandeImagePerfilAtom.reportRead();
    return super.newBackgrandeImagePerfil;
  }

  @override
  set newBackgrandeImagePerfil(LocalImage? value) {
    _$newBackgrandeImagePerfilAtom
        .reportWrite(value, super.newBackgrandeImagePerfil, () {
      super.newBackgrandeImagePerfil = value;
    });
  }

  late final _$newAvataImagePerfilAtom =
      Atom(name: '_Perfil_Store.newAvataImagePerfil', context: context);

  @override
  LocalImage? get newAvataImagePerfil {
    _$newAvataImagePerfilAtom.reportRead();
    return super.newAvataImagePerfil;
  }

  @override
  set newAvataImagePerfil(LocalImage? value) {
    _$newAvataImagePerfilAtom.reportWrite(value, super.newAvataImagePerfil, () {
      super.newAvataImagePerfil = value;
    });
  }

  late final _$newNickNamePerfilControllerAtom =
      Atom(name: '_Perfil_Store.newNickNamePerfilController', context: context);

  @override
  TextEditingController get newNickNamePerfilController {
    _$newNickNamePerfilControllerAtom.reportRead();
    return super.newNickNamePerfilController;
  }

  @override
  set newNickNamePerfilController(TextEditingController value) {
    _$newNickNamePerfilControllerAtom
        .reportWrite(value, super.newNickNamePerfilController, () {
      super.newNickNamePerfilController = value;
    });
  }

  late final _$newStoryPerfilControllerAtom =
      Atom(name: '_Perfil_Store.newStoryPerfilController', context: context);

  @override
  TextEditingController get newStoryPerfilController {
    _$newStoryPerfilControllerAtom.reportRead();
    return super.newStoryPerfilController;
  }

  @override
  set newStoryPerfilController(TextEditingController value) {
    _$newStoryPerfilControllerAtom
        .reportWrite(value, super.newStoryPerfilController, () {
      super.newStoryPerfilController = value;
    });
  }

  late final _$IsVisitantePerfilPageAtom =
      Atom(name: '_Perfil_Store.IsVisitantePerfilPage', context: context);

  @override
  bool get IsVisitantePerfilPage {
    _$IsVisitantePerfilPageAtom.reportRead();
    return super.IsVisitantePerfilPage;
  }

  @override
  set IsVisitantePerfilPage(bool value) {
    _$IsVisitantePerfilPageAtom.reportWrite(value, super.IsVisitantePerfilPage,
        () {
      super.IsVisitantePerfilPage = value;
    });
  }

  late final _$getNewAvataAsyncAction =
      AsyncAction('_Perfil_Store.getNewAvata', context: context);

  @override
  Future<void> getNewAvata() {
    return _$getNewAvataAsyncAction.run(() => super.getNewAvata());
  }

  late final _$_Perfil_StoreActionController =
      ActionController(name: '_Perfil_Store', context: context);

  @override
  void descartNewAvatar() {
    final _$actionInfo = _$_Perfil_StoreActionController.startAction(
        name: '_Perfil_Store.descartNewAvatar');
    try {
      return super.descartNewAvatar();
    } finally {
      _$_Perfil_StoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void descartNewbackgranded() {
    final _$actionInfo = _$_Perfil_StoreActionController.startAction(
        name: '_Perfil_Store.descartNewbackgranded');
    try {
      return super.descartNewbackgranded();
    } finally {
      _$_Perfil_StoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePageToPefil(BuildContext context) {
    final _$actionInfo = _$_Perfil_StoreActionController.startAction(
        name: '_Perfil_Store.changePageToPefil');
    try {
      return super.changePageToPefil(context);
    } finally {
      _$_Perfil_StoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePageToEditarPerfil(BuildContext context, AppController app) {
    final _$actionInfo = _$_Perfil_StoreActionController.startAction(
        name: '_Perfil_Store.changePageToEditarPerfil');
    try {
      return super.changePageToEditarPerfil(context, app);
    } finally {
      _$_Perfil_StoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newBackgrandeImagePerfil: ${newBackgrandeImagePerfil},
newAvataImagePerfil: ${newAvataImagePerfil},
newNickNamePerfilController: ${newNickNamePerfilController},
newStoryPerfilController: ${newStoryPerfilController},
IsVisitantePerfilPage: ${IsVisitantePerfilPage}
    ''';
  }
}
