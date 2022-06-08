import 'package:dartz/dartz.dart';
import 'package:testes_de_estudos/App/Auth/Domain/Entities/UserEntitie.dart';
import 'package:testes_de_estudos/App/Controller/AppController.dart';

import 'package:testes_de_estudos/App/Data_Source/Infra/Repository/UserData_Souce_Repositore.dart';
import 'package:testes_de_estudos/App/Data_Source/error/Data_source_Expition.dart';
import 'package:testes_de_estudos/App/LocalServices/Entities/ImageDataEntitie.dart';
import 'package:testes_de_estudos/App/Services/AppInstances.dart';

abstract class UserDataSourcerUserCase {
  Future<Either<DataSourceException, String>> saveName(String newName);
  Future<Either<DataSourceException, String>> saveStory(String newStory);
  Future<DataSourceException?> saveAvata(LocalImage? newAvatar);
  Future<DataSourceException?> saveBackgrondImage(
      LocalImage newBackGrandedImage);
  Future saveNewUserData(CadastroFormEntity cadastroForm);
}

class UserDataSourcerUserCaseImpl implements UserDataSourcerUserCase {
  final AppController app = AppSevices.appController;
  final UserDataSourcerRepository repository;
  UserDataSourcerUserCaseImpl({required this.repository});

  @override
  Future<Either<DataSourceException, String>> saveName(String newName) async {
    if (newName.length >= 4 && app.getMyUser().nome != newName) {
      return await repository.saveName(newName);
    } else if (!(newName.length >= 4)) {
      return left(DataSourceException(message: 'Nome Muito Curto!'));
    } else {
      return left(DataSourceException(message: 'sem alteração!'));
    }
  }

  @override
  Future<Either<DataSourceException, String>> saveStory(String newStory) async {
    if (newStory != app.getMyUser().story) {
      return await repository.saveStory(newStory);
    } else {
      return left(DataSourceException(message: 'sem alteração!'));
    }
  }

  @override
  Future<DataSourceException?> saveAvata(LocalImage? newAvatar) async {
    if (newAvatar != null) {
      return await repository.saveAvata(newAvatar);
    }
    return null;
  }

  @override
  Future<DataSourceException?> saveBackgrondImage(
      LocalImage newBackGrandedImage) async {
    if (newBackGrandedImage != null) {
      return await repository.saveBackgrondImage(newBackGrandedImage);
    }
    return null;
  }

  @override
  Future saveNewUserData(CadastroFormEntity cadastroForm) async {
    await repository.saveNewUserData(cadastroForm);
  }
}
