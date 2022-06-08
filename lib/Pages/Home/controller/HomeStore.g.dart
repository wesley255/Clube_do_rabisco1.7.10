// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$localImageHomePostAtom =
      Atom(name: '_HomeStore.localImageHomePost', context: context);

  @override
  LocalImage? get localImageHomePost {
    _$localImageHomePostAtom.reportRead();
    return super.localImageHomePost;
  }

  @override
  set localImageHomePost(LocalImage? value) {
    _$localImageHomePostAtom.reportWrite(value, super.localImageHomePost, () {
      super.localImageHomePost = value;
    });
  }

  late final _$homeTextControllerAtom =
      Atom(name: '_HomeStore.homeTextController', context: context);

  @override
  TextEditingController get homeTextController {
    _$homeTextControllerAtom.reportRead();
    return super.homeTextController;
  }

  @override
  set homeTextController(TextEditingController value) {
    _$homeTextControllerAtom.reportWrite(value, super.homeTextController, () {
      super.homeTextController = value;
    });
  }

  late final _$selectHomeImagePostAsyncAction =
      AsyncAction('_HomeStore.selectHomeImagePost', context: context);

  @override
  Future<dynamic> selectHomeImagePost(BuildContext context) {
    return _$selectHomeImagePostAsyncAction
        .run(() => super.selectHomeImagePost(context));
  }

  late final _$uploadNewPostsAsyncAction =
      AsyncAction('_HomeStore.uploadNewPosts', context: context);

  @override
  Future<void> uploadNewPosts(BuildContext context) {
    return _$uploadNewPostsAsyncAction.run(() => super.uploadNewPosts(context));
  }

  @override
  String toString() {
    return '''
localImageHomePost: ${localImageHomePost},
homeTextController: ${homeTextController}
    ''';
  }
}
