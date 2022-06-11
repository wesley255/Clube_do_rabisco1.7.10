import 'package:testes_de_estudos/App/src/Auth/Domain/Entities/UserEntitie.dart';

abstract class AuthDatasorceLoginContract {
  Future<LoggedUserEntity> login(LoginFormEntity loginForm);
}
