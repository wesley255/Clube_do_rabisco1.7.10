// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppController on _AppController, Store {
  Computed<List<Post>>? _$getMyPostComputed;

  @override
  List<Post> get getMyPost =>
      (_$getMyPostComputed ??= Computed<List<Post>>(() => super.getMyPost,
              name: '_AppController.getMyPost'))
          .value;
  Computed<List<Post>>? _$getMyFavoritoPostComputed;

  @override
  List<Post> get getMyFavoritoPost => (_$getMyFavoritoPostComputed ??=
          Computed<List<Post>>(() => super.getMyFavoritoPost,
              name: '_AppController.getMyFavoritoPost'))
      .value;

  late final _$loggedUserAtom =
      Atom(name: '_AppController.loggedUser', context: context);

  @override
  LoggedUserEntity? get loggedUser {
    _$loggedUserAtom.reportRead();
    return super.loggedUser;
  }

  @override
  set loggedUser(LoggedUserEntity? value) {
    _$loggedUserAtom.reportWrite(value, super.loggedUser, () {
      super.loggedUser = value;
    });
  }

  late final _$appLoadingAtom =
      Atom(name: '_AppController.appLoading', context: context);

  @override
  bool get appLoading {
    _$appLoadingAtom.reportRead();
    return super.appLoading;
  }

  @override
  set appLoading(bool value) {
    _$appLoadingAtom.reportWrite(value, super.appLoading, () {
      super.appLoading = value;
    });
  }

  late final _$inicialiceListsAsyncAction =
      AsyncAction('_AppController.inicialiceLists', context: context);

  @override
  Future<void> inicialiceLists() {
    return _$inicialiceListsAsyncAction.run(() => super.inicialiceLists());
  }

  late final _$inicializeAppAsyncAction =
      AsyncAction('_AppController.inicializeApp', context: context);

  @override
  Future<void> inicializeApp() {
    return _$inicializeAppAsyncAction.run(() => super.inicializeApp());
  }

  late final _$_AppControllerActionController =
      ActionController(name: '_AppController', context: context);

  @override
  dynamic setLoggeduser(LoggedUserEntity? user) {
    final _$actionInfo = _$_AppControllerActionController.startAction(
        name: '_AppController.setLoggeduser');
    try {
      return super.setLoggeduser(user);
    } finally {
      _$_AppControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic singout() {
    final _$actionInfo = _$_AppControllerActionController.startAction(
        name: '_AppController.singout');
    try {
      return super.singout();
    } finally {
      _$_AppControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loggedUser: ${loggedUser},
appLoading: ${appLoading},
getMyPost: ${getMyPost},
getMyFavoritoPost: ${getMyFavoritoPost}
    ''';
  }
}
