import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testes_de_estudos/App/src/Auth/Domain/Entities/UserEntitie.dart';
import 'package:testes_de_estudos/App/src/Auth/Domain/Errors/AuthExepition.dart';
import 'package:testes_de_estudos/App/src/Auth/infra/Datasource/Auth_datasource_Login.dart';

abstract class AuthRepositoryLoginContract {
  Future<Either<AuthExeption, LoggedUserEntity>> login(
      LoginFormEntity loginForm);
}

class AuthRepositoryLogin implements AuthRepositoryLoginContract {
  final AuthDatasorceLoginContract externoLogin;
  AuthRepositoryLogin(this.externoLogin);
  @override
  login(LoginFormEntity loginForm) async {
    try {
      LoggedUserEntity result = await externoLogin.login(loginForm);
      return right(result);
    } on FirebaseAuthException catch (error) {
      String? _emailErro;
      String? _senhaErro;
      if (error.message ==
          'There is no user record corresponding to this identifier. The user may have been deleted.') {
        _emailErro = 'Usuario não Encontrado';
      }
      if (error.message ==
          'The password is invalid or the user does not have a password.') {
        _senhaErro = 'Senha invalida!';
      }
      return left(AuthExeption(senhaError: _senhaErro, emailError: _emailErro));
    }
  }
}
