// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ComentarioPageController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ComentarioPageController on _ComentarioPageController, Store {
  Computed<List<ComentariosForm>>? _$getlistComentariosComputed;

  @override
  List<ComentariosForm> get getlistComentarios =>
      (_$getlistComentariosComputed ??= Computed<List<ComentariosForm>>(
              () => super.getlistComentarios,
              name: '_ComentarioPageController.getlistComentarios'))
          .value;

  late final _$controllerAtom =
      Atom(name: '_ComentarioPageController.controller', context: context);

  @override
  TextEditingController get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(TextEditingController value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  late final _$_ComentarioPageControllerActionController =
      ActionController(name: '_ComentarioPageController', context: context);

  @override
  void dispose() {
    final _$actionInfo = _$_ComentarioPageControllerActionController
        .startAction(name: '_ComentarioPageController.dispose');
    try {
      return super.dispose();
    } finally {
      _$_ComentarioPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
controller: ${controller},
getlistComentarios: ${getlistComentarios}
    ''';
  }
}
