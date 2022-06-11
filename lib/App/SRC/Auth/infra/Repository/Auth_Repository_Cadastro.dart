import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testes_de_estudos/App/src/Auth/Domain/Entities/UserEntitie.dart';
import 'package:testes_de_estudos/App/src/Auth/Domain/Errors/AuthExepition.dart';
import 'package:testes_de_estudos/App/src/Auth/infra/Datasource/Auth_datasource_Cadastro.dart';

abstract class AuthRepositoryCadastroContract {
  Future<Either<AuthExeption, LoggedUserEntity>> cadastrar(
      CadastroFormEntity formCadastro);
}

class AuthRepositoryCadastro implements AuthRepositoryCadastroContract {
  final AuthdatasourceCadastroContract externo;
  AuthRepositoryCadastro(this.externo);
  @override
  cadastrar(CadastroFormEntity formCadastro) async {
    try {
      await externo.cadastrar(formCadastro);
      return right(LoggedUserEntity(email: formCadastro.email));
    } on FirebaseAuthException catch (error) {
      /*-----------------------[error]-----------------------*/
      String? _errorEmail;
      if (error.message ==
          'The email address is already in use by another account.') {
        _errorEmail = 'Este email ja esta sendo Usado!';
      }
      return left(AuthExeption(emailError: _errorEmail));
    }
  }
}
