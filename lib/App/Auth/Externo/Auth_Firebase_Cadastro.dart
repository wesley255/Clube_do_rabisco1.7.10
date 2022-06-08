import 'package:firebase_auth/firebase_auth.dart';
import 'package:testes_de_estudos/App/Auth/Domain/Entities/UserEntitie.dart';
import 'package:testes_de_estudos/App/Auth/infra/Datasource/Auth_datasource_Cadastro.dart';
import 'package:testes_de_estudos/App/Services/AppInstances.dart';

class AuthdatasourceCadastro implements AuthdatasourceCadastroContract {
  @override
  cadastrar(CadastroFormEntity formCadastro) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: formCadastro.email,
      password: formCadastro.senha,
    );
  }
}
