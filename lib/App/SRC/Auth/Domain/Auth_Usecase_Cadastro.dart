import 'package:dartz/dartz.dart';
import 'package:email_validator/email_validator.dart';
import 'package:testes_de_estudos/App/Services/AppInstances.dart';
import 'package:testes_de_estudos/App/src/Auth/Domain/Entities/UserEntitie.dart';
import 'package:testes_de_estudos/App/src/Auth/Domain/Errors/AuthExepition.dart';
import 'package:testes_de_estudos/App/src/Auth/infra/Repository/Auth_Repository_Cadastro.dart';

abstract class AuthUsercaseCadastoContract {
  Future<Either<AuthExeption, LoggedUserEntity>> cadastra(
      CadastroFormEntity formCadastro);
}

class AuthUsercaseCadasto implements AuthUsercaseCadastoContract {
  final AuthRepositoryCadastroContract repositoryCadastror;
  AuthUsercaseCadasto(this.repositoryCadastror);
  @override
  cadastra(CadastroFormEntity formCadastro) async {
    /*------------------------------[cache]------------------------------*/
    bool fromValidado = true;
    String? _errorEmail;
    String? _errorSenha;
    String? _errorConfirmarSenha;
    String? _errorNick;
    String? _errorUsername;
    /*------------------------------[cache]------------------------------*/
    //
    /*------------------------------[validação]------------------------------*/
    /*------------------------------[username]------------------------------*/
    if (formCadastro.username == '') {
      _errorUsername = 'Informe seu user_name!';
      fromValidado = false;
    } else if (!(formCadastro.username.contains('@'))) {
      _errorUsername = 'UserName e invalido!';
      fromValidado = false;
    }
    /*------------------------------[username]------------------------------*/
    /*------------------------------[Email]------------------------------*/
    if (formCadastro.email == '') {
      _errorEmail = 'Informe seu email!';
      fromValidado = false;
    } else if (!EmailValidator.validate(formCadastro.email)) {
      _errorEmail = 'Email invalido!';
      fromValidado = false;
    }
    /*------------------------------[Email]------------------------------*/
    /*------------------------------[senha]------------------------------*/
    if (formCadastro.senha == '') {
      _errorSenha = 'Infome sua senha!';
      fromValidado = false;
    } else if (formCadastro.senha.length < 8) {
      _errorSenha = 'Senha muito curta!';
      fromValidado = false;
    }
    /*------------------------------[senha]------------------------------*/
    /*------------------------------[confirmar senha]------------------------------*/
    if (formCadastro.senha != formCadastro.confirmarSenha) {
      _errorConfirmarSenha = 'As senha não são iguais!';
      fromValidado = false;
    }
    /*------------------------------[confirmar senha]------------------------------*/
    if (formCadastro.nickName == '') {
      _errorNick = 'Informe seu nick!';
      fromValidado = false;
    } else if (formCadastro.nickName.length <= 3) {
      _errorNick = 'nick Muito Curto';
      fromValidado = false;
    }
    /*----------------------------/\--[validação]--/\----------------------------*/
    if (fromValidado) {
      /*-----------------------[Repository]----------------------- */
      var result = await repositoryCadastror.cadastrar(formCadastro);
      /*-----------------------[Repository]----------------------- */
      return await result.fold(
        (error) {
          return left(error);
        },
        (loggedUser) async {
          await AppSevices.userDocUpdateSevices.saveNewUserData(formCadastro);
          AppSevices.appController.loggedUser = loggedUser;
          return right(loggedUser);
        },
      ); //
    }
    return left(AuthExeption(
      emailError: _errorEmail,
      senhaError: _errorSenha,
      confirmarSenhaError: _errorConfirmarSenha,
      nameError: _errorNick,
      userNameError: _errorUsername,
    ));
  }
}
