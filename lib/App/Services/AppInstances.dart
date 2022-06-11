import 'package:testes_de_estudos/App/Controller/AppController.dart';
import 'package:testes_de_estudos/App/Data_Source/Domain/Data_Source_UserCase.dart';
import 'package:testes_de_estudos/App/Data_Source/Domain/User_Actions_Datasorce_UserCase.dart';
import 'package:testes_de_estudos/App/Data_Source/Domain/User_DataSourcerUserCase.dart';
import 'package:testes_de_estudos/App/Data_Source/Externo/FirebaseCloud.dart';
import 'package:testes_de_estudos/App/Data_Source/Externo/FirebaseCloud_user.dart';
import 'package:testes_de_estudos/App/Data_Source/Externo/FirebaseCloud_user_Actions.dart';
import 'package:testes_de_estudos/App/Data_Source/Infra/Repository/DataSourceRepositore.dart';
import 'package:testes_de_estudos/App/Data_Source/Infra/Repository/UserData_Souce_Repositore.dart';
import 'package:testes_de_estudos/App/src/Auth/Domain/Auth_Usecase_Cadastro.dart';
import 'package:testes_de_estudos/App/src/Auth/Domain/Auth_Usercase_Login.dart';
import 'package:testes_de_estudos/App/src/Auth/Externo/Auth_Cheack.dart';
import 'package:testes_de_estudos/App/src/Auth/Externo/Auth_Firebase_Cadastro.dart';
import 'package:testes_de_estudos/App/src/Auth/Externo/Auth_Firebase_Login.dart';
import 'package:testes_de_estudos/App/src/Auth/infra/Repository/Auth_Repository_Cadastro.dart';
import 'package:testes_de_estudos/App/src/Auth/infra/Repository/Auth_Repository_Login.dart';

class AppSevices {
  static final AppController appController = AppController();
  //
  static final DataSourceUsercaseUserCase webdatasorce =
      DataSourceUsercaseUserCaseIMPL(DataSourceRepositoriyIMPL(
    FirebaseCloud(),
  ));
  //

  //
  static final UserDataSourcerUserCase userDocUpdateSevices =
      UserDataSourcerUserCaseImpl(
    repository: UserDataSourcerRepositoryImpl(
      userDataSourcer: FirebaseCloudUserData(),
    ),
  );
  static final UserActionUsecase userActions = UserActionUsecaseImpl(
    userDatasorceActions: FirebaseUserActions(),
  );
  static final _Auth auth = _Auth();
}

class _Auth {
  final AuthUsercaseLoginContract login = AuthUsercaseLogin(
    AuthRepositoryLogin(AuthFirebaseLogin()),
  );
  final AuthCheakContract check = Authcheck();
  final AuthsingoutContract singout = Singout();
  final AuthUsercaseCadastoContract register =
      AuthUsercaseCadasto(AuthRepositoryCadastro(AuthdatasourceCadastro()));
}
