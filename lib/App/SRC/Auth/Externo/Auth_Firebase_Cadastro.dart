import 'package:firebase_auth/firebase_auth.dart';
import 'package:testes_de_estudos/App/src/Auth/Domain/Entities/UserEntitie.dart';
import 'package:testes_de_estudos/App/src/Auth/infra/Datasource/Auth_datasource_Cadastro.dart';

class AuthdatasourceCadastro implements AuthdatasourceCadastroContract {
  @override
  cadastrar(CadastroFormEntity formCadastro) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: formCadastro.email,
      password: formCadastro.senha,
    );
  }
}
