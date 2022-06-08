import 'package:firebase_auth/firebase_auth.dart';
import 'package:testes_de_estudos/App/Auth/Domain/Entities/UserEntitie.dart';
import 'package:testes_de_estudos/App/Auth/infra/Datasource/Auth_datasource_Login.dart';

class AuthFirebaseLogin implements AuthDatasorceLoginContract {
  @override
  login(LoginFormEntity loginForm) async {
    var value = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: loginForm.email,
      password: loginForm.senha,
    );
    return LoggedUserEntity(email: value.user!.email!);
  }
}
