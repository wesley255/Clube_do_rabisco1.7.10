import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testes_de_estudos/App/src/Auth/Domain/Auth_Usecase_Cadastro.dart';
import 'package:testes_de_estudos/App/src/Auth/Domain/Entities/UserEntitie.dart';
import 'package:testes_de_estudos/App/src/Auth/infra/Repository/Auth_Repository_Cadastro.dart';

class MockRepository implements AuthRepositoryCadastroContract {
  @override
  cadastrar(CadastroFormEntity formCadastro) async {
    return right(LoggedUserEntity());
  }
}

void main() {
  final MockRepository mockRepository = MockRepository();
  final AuthUsercaseCadasto auth = AuthUsercaseCadasto(mockRepository);

  test('email invalido', () async {
    var result = await auth.cadastra(cadastroemailInvalido);
    expect(result.isLeft(), true);
  });
  test('senhas são diferte', () async {
    var result = await auth.cadastra(cadastroSenhaSaoDiferntes);
    expect(result.isLeft(), true);
  });
  test('Nick name muito Curto!', () async {
    var result = await auth.cadastra(cadastronickMuitoCurto);
    expect(result.isLeft(), true);
  });
  test('email vazil!', () async {
    var result = await auth.cadastra(cadastronEmailVasil);
    expect(result.isLeft(), true);
  });
  test('userName invalido!', () async {
    var result = await auth.cadastra(cadastronUsernameInvalido);
    expect(result.isLeft(), true);
  });
  test('userName vasil!', () async {
    var result = await auth.cadastra(cadastronUsernamevasil);
    expect(result.isLeft(), true);
  });
}

CadastroFormEntity cadastroCerto = CadastroFormEntity(
  nickName: 'nickName',
  email: 'email@gmail.com',
  senha: '12345678',
  username: '@username',
  confirmarSenha: '12345678',
);
CadastroFormEntity cadastroemailInvalido = CadastroFormEntity(
  nickName: 'nickName',
  email: 'emaigmailcom',
  senha: '12345678',
  username: '@username',
  confirmarSenha: '12345678',
);
CadastroFormEntity cadastroSenhaSaoDiferntes = CadastroFormEntity(
  nickName: 'nickName',
  email: 'email@gmail.com',
  senha: '12345678',
  username: '@username',
  confirmarSenha: 'gkospokgh',
);
CadastroFormEntity cadastronickMuitoCurto = CadastroFormEntity(
  nickName: 'nic',
  email: 'email@gmail.com',
  senha: '12345678',
  username: '@username',
  confirmarSenha: 'gkospokgh',
);
CadastroFormEntity cadastronEmailVasil = CadastroFormEntity(
  nickName: 'nic',
  email: '',
  senha: '12345678',
  username: '@username',
  confirmarSenha: 'gkospokgh',
);
CadastroFormEntity cadastronUsernameInvalido = CadastroFormEntity(
  nickName: 'neko',
  email: 'neko@gmail.com',
  senha: '12345678',
  username: 'username',
  confirmarSenha: '12345678',
);
CadastroFormEntity cadastronUsernamevasil = CadastroFormEntity(
  nickName: 'neko',
  email: 'neko@gmail.com',
  senha: '12345678',
  username: '',
  confirmarSenha: '12345678',
);
