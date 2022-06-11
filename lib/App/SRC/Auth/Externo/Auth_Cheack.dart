import 'package:firebase_auth/firebase_auth.dart';
import 'package:testes_de_estudos/App/src/Auth/Domain/Entities/UserEntitie.dart';

abstract class AuthCheakContract {
  LoggedUserEntity? getLoggedUser();
}

abstract class AuthsingoutContract {
  singout();
}

class Authcheck implements AuthCheakContract {
  @override
  getLoggedUser() {
    String? _useremail = FirebaseAuth.instance.currentUser?.email;
    if (_useremail != null) {
      return LoggedUserEntity(email: _useremail);
    }
    return null;
    /* FirebaseAuth.instance.authStateChanges().listen((event) {
      LoggedUserEntity? user = LoggedUserEntity(email: event!.email!);
      AppSevices.appController.setLoggeduser(user);
    });*/
  }
}

class Singout implements AuthsingoutContract {
  @override
  singout() {
    FirebaseAuth.instance.signOut();
  }
}
