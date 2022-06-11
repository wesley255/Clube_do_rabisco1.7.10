import 'package:dartz/dartz.dart';
import 'package:email_validator/email_validator.dart';

import 'package:testes_de_estudos/App/Services/AppInstances.dart';
import 'package:testes_de_estudos/App/src/Auth/Domain/Entities/UserEntitie.dart';
import 'package:testes_de_estudos/App/src/Auth/Domain/Errors/AuthExepition.dart';
import 'package:testes_de_estudos/App/src/Auth/infra/Repository/Auth_Repository_Login.dart';

abstract class AuthUsercaseLoginContract {
  Future<Either<AuthExeption, LoggedUserEntity>> login(
    LoginFormEntity loginForm,
  );
}

class AuthUsercaseLogin implements AuthUsercaseLoginContract {
  final AuthRepositoryLoginContract authRepositoryLogin;
  AuthUsercaseLogin(this.authRepositoryLogin);
  @override
  Future<Either<AuthExeption, LoggedUserEntity>> login(
    LoginFormEntity loginForm,
  ) async {
    String? _errorEmail;
    String? _errorSenha;
    if (EmailValidator.validate(loginForm.email)) {
      /*-----------------------[Repository]----------------------- */
      Either<AuthExeption, LoggedUserEntity> result =
          await authRepositoryLogin.login(loginForm);
      /*-----------------------[Repository]----------------------- */
      return result.fold(
        (error) {
          return left(error);
        },
        (loggedUser) {
          AppSevices.appController.loggedUser = loggedUser;
          return right(loggedUser);
        },
      );
    } else if (loginForm.email == '') {
      _errorEmail = 'Informe seu email!';
    } else {
      _errorEmail = 'Email invalido!';
    }
    if (loginForm.senha == '') {
      _errorSenha = 'Infome sua senha!';
    } else if (loginForm.senha.length < 8) {
      _errorSenha = 'Senha muito curta!';
    }
    return left(AuthExeption(emailError: _errorEmail, senhaError: _errorSenha));
  }
}
