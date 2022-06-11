import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:testes_de_estudos/App/Data_Source/error/Data_source_Expition.dart';
import 'package:testes_de_estudos/App/LocalServices/Entities/ImageDataEntitie.dart';
import 'package:testes_de_estudos/App/src/Auth/Domain/Entities/UserEntitie.dart';

abstract class UserDataSourcer {
  Future<Either<DataSourceException, String>> saveName(String newName);
  Future<Either<Exception, String>> saveStory(String newStory);
  Future<Exception?> saveAvata(LocalImage newAvatar);
  Future<Exception?> saveBackgrondImage(LocalImage newBackGrandedImage);
  Future saveNewUserData(CadastroFormEntity cadastroForm);
}
