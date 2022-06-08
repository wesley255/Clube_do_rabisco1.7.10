import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:testes_de_estudos/App/Auth/Domain/Auth_Usercase_Login.dart';
import 'package:testes_de_estudos/App/Auth/Domain/Entities/UserEntitie.dart';
import 'package:testes_de_estudos/App/Auth/Domain/Errors/AuthExepition.dart';
import 'package:testes_de_estudos/App/Auth/infra/Datasource/Auth_datasource_Login.dart';

import 'package:testes_de_estudos/App/Auth/infra/Repository/Auth_Repository_Login.dart';

class MockExterno extends AuthDatasorceLoginContract {
  @override
  login(LoginFormEntity loginForm) async {
    return LoggedUserEntity(
      email: loginForm.email,
    );
  }
}

MockExterno externo = MockExterno();

void main() {
  final AuthRepositoryLoginContract mockLoginRpositore =
      AuthRepositoryLogin(externo);
  final AuthUsercaseLoginContract mockauthusercase = AuthUsercaseLogin(
    mockLoginRpositore,
  );
  test('Email Invalido', () async {
    var value = await mockauthusercase.login(loginEmailInvalido);
    expect(value.isLeft(), true);
    print(value.fold((l) => l.emailError, (r) => r.email));
  });
  test('login Sucesso', () async {
    var value = await mockauthusercase.login(loginCerto);
    print(value.fold((l) => l.emailError, (r) => r.email));
    expect(value.isRight(), true);
  });
}

LoginFormEntity loginCerto = LoginFormEntity(
  email: 'email@gmail.com',
  senha: '12345678',
);
LoginFormEntity loginEmailInvalido = LoginFormEntity(
  email: 'emaigmail.com',
  senha: '12345678',
);
LoginFormEntity loginEmailnaoEncontrado = LoginFormEntity(
  email: 'emaisggasggrh@gmail.com',
  senha: '12345678',
);
