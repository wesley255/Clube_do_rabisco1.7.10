import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:testes_de_estudos/App/Data_Source/Infra/DataSource/UserDataSoucer.dart';
import 'package:testes_de_estudos/App/Data_Source/error/Data_source_Expition.dart';
import 'package:testes_de_estudos/App/LocalServices/Entities/ImageDataEntitie.dart';

import '../../../Auth/Domain/Entities/UserEntitie.dart';

abstract class UserDataSourcerRepository {
  Future<Either<DataSourceException, String>> saveName(String newName);
  Future<Either<DataSourceException, String>> saveStory(String newStory);
  Future<DataSourceException?> saveAvata(LocalImage newAvatar);
  Future<DataSourceException?> saveBackgrondImage(
      LocalImage newBackGrandedImage);
  Future saveNewUserData(CadastroFormEntity cadastroForm);
}

class UserDataSourcerRepositoryImpl implements UserDataSourcerRepository {
  final UserDataSourcer userDataSourcer;
  UserDataSourcerRepositoryImpl({required this.userDataSourcer});
  @override
  Future<DataSourceException?> saveAvata(LocalImage newAvatar) async {
    try {
      await userDataSourcer.saveAvata(newAvatar);
    } on DataSourceException catch (e) {
      return e;
    }
  }

  @override
  Future<DataSourceException?> saveBackgrondImage(
      LocalImage newBackGrandedImage) async {
    try {
      await userDataSourcer.saveBackgrondImage(newBackGrandedImage);
    } on DataSourceException catch (e) {
      return e;
    }
  }

  @override
  Future<Either<DataSourceException, String>> saveName(String newName) async {
    return await userDataSourcer.saveName(newName);
  }

  @override
  Future<Either<DataSourceException, String>> saveStory(String newStory) async {
    var _value = await userDataSourcer.saveStory(newStory);
    return _value.fold(
      (error) {
        return left(DataSourceException(
          message: (error as FirebaseException).message!,
        ));
      },
      (r) {
        return right(r);
      },
    );
  }

  @override
  Future saveNewUserData(CadastroFormEntity cadastroForm) async {
    await userDataSourcer.saveNewUserData(cadastroForm);
  }
}
