// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on _LoginController, Store {
  late final _$isloginAtom =
      Atom(name: '_LoginController.islogin', context: context);

  @override
  bool get islogin {
    _$isloginAtom.reportRead();
    return super.islogin;
  }

  @override
  set islogin(bool value) {
    _$isloginAtom.reportWrite(value, super.islogin, () {
      super.islogin = value;
    });
  }

  late final _$exibirSenhaAtom =
      Atom(name: '_LoginController.exibirSenha', context: context);

  @override
  bool get exibirSenha {
    _$exibirSenhaAtom.reportRead();
    return super.exibirSenha;
  }

  @override
  set exibirSenha(bool value) {
    _$exibirSenhaAtom.reportWrite(value, super.exibirSenha, () {
      super.exibirSenha = value;
    });
  }

  late final _$parmAtom = Atom(name: '_LoginController.parm', context: context);

  @override
  LoginParmController get parm {
    _$parmAtom.reportRead();
    return super.parm;
  }

  @override
  set parm(LoginParmController value) {
    _$parmAtom.reportWrite(value, super.parm, () {
      super.parm = value;
    });
  }

  late final _$testAtom = Atom(name: '_LoginController.test', context: context);

  @override
  String get test {
    _$testAtom.reportRead();
    return super.test;
  }

  @override
  set test(String value) {
    _$testAtom.reportWrite(value, super.test, () {
      super.test = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_LoginController.login', context: context);

  @override
  Future login(BuildContext context) {
    return _$loginAsyncAction.run(() => super.login(context));
  }

  late final _$cadastrarAsyncAction =
      AsyncAction('_LoginController.cadastrar', context: context);

  @override
  Future cadastrar(BuildContext context) {
    return _$cadastrarAsyncAction.run(() => super.cadastrar(context));
  }

  late final _$_LoginControllerActionController =
      ActionController(name: '_LoginController', context: context);

  @override
  void mostraououcutarSenha(bool valuee) {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.mostraououcutarSenha');
    try {
      return super.mostraououcutarSenha(valuee);
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changePage() {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.changePage');
    try {
      return super.changePage();
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
islogin: ${islogin},
exibirSenha: ${exibirSenha},
parm: ${parm},
test: ${test}
    ''';
  }
}
