// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Desafios_page_Controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DesafioPageControllerMobx on _DesafilPageControllerIMLP, Store {
  late final _$tituloControllerAtom = Atom(
      name: '_DesafilPageControllerIMLP.tituloController', context: context);

  @override
  TextEditingController get tituloController {
    _$tituloControllerAtom.reportRead();
    return super.tituloController;
  }

  @override
  set tituloController(TextEditingController value) {
    _$tituloControllerAtom.reportWrite(value, super.tituloController, () {
      super.tituloController = value;
    });
  }

  late final _$tagControllerAtom =
      Atom(name: '_DesafilPageControllerIMLP.tagController', context: context);

  @override
  TextEditingController get tagController {
    _$tagControllerAtom.reportRead();
    return super.tagController;
  }

  @override
  set tagController(TextEditingController value) {
    _$tagControllerAtom.reportWrite(value, super.tagController, () {
      super.tagController = value;
    });
  }

  late final _$regrasControllerAtom = Atom(
      name: '_DesafilPageControllerIMLP.regrasController', context: context);

  @override
  TextEditingController get regrasController {
    _$regrasControllerAtom.reportRead();
    return super.regrasController;
  }

  @override
  set regrasController(TextEditingController value) {
    _$regrasControllerAtom.reportWrite(value, super.regrasController, () {
      super.regrasController = value;
    });
  }

  late final _$desafioImageSelectAtom = Atom(
      name: '_DesafilPageControllerIMLP.desafioImageSelect', context: context);

  @override
  File? get desafioImageSelect {
    _$desafioImageSelectAtom.reportRead();
    return super.desafioImageSelect;
  }

  @override
  set desafioImageSelect(File? value) {
    _$desafioImageSelectAtom.reportWrite(value, super.desafioImageSelect, () {
      super.desafioImageSelect = value;
    });
  }

  late final _$diasAtom =
      Atom(name: '_DesafilPageControllerIMLP.dias', context: context);

  @override
  int get dias {
    _$diasAtom.reportRead();
    return super.dias;
  }

  @override
  set dias(int value) {
    _$diasAtom.reportWrite(value, super.dias, () {
      super.dias = value;
    });
  }

  late final _$saveNewDesafioAsyncAction = AsyncAction(
      '_DesafilPageControllerIMLP.saveNewDesafio',
      context: context);

  @override
  Future<void> saveNewDesafio() {
    return _$saveNewDesafioAsyncAction.run(() => super.saveNewDesafio());
  }

  late final _$getListDesafiosAsyncAction = AsyncAction(
      '_DesafilPageControllerIMLP.getListDesafios',
      context: context);

  @override
  Future<void> getListDesafios() {
    return _$getListDesafiosAsyncAction.run(() => super.getListDesafios());
  }

  late final _$getimageDesafiolAsyncAction = AsyncAction(
      '_DesafilPageControllerIMLP.getimageDesafiol',
      context: context);

  @override
  Future<void> getimageDesafiol() {
    return _$getimageDesafiolAsyncAction.run(() => super.getimageDesafiol());
  }

  late final _$_DesafilPageControllerIMLPActionController =
      ActionController(name: '_DesafilPageControllerIMLP', context: context);

  @override
  void addDayDesafio() {
    final _$actionInfo = _$_DesafilPageControllerIMLPActionController
        .startAction(name: '_DesafilPageControllerIMLP.addDayDesafio');
    try {
      return super.addDayDesafio();
    } finally {
      _$_DesafilPageControllerIMLPActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remuveDayDesafio() {
    final _$actionInfo = _$_DesafilPageControllerIMLPActionController
        .startAction(name: '_DesafilPageControllerIMLP.remuveDayDesafio');
    try {
      return super.remuveDayDesafio();
    } finally {
      _$_DesafilPageControllerIMLPActionController.endAction(_$actionInfo);
    }
  }

  @override
  void tagConfig() {
    final _$actionInfo = _$_DesafilPageControllerIMLPActionController
        .startAction(name: '_DesafilPageControllerIMLP.tagConfig');
    try {
      return super.tagConfig();
    } finally {
      _$_DesafilPageControllerIMLPActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tituloController: ${tituloController},
tagController: ${tagController},
regrasController: ${regrasController},
desafioImageSelect: ${desafioImageSelect},
dias: ${dias}
    ''';
  }
}
