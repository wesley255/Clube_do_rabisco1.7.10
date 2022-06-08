import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:testes_de_estudos/App/Auth/Domain/Entities/UserEntitie.dart';

abstract class AuthDatasorceLoginContract {
  Future<LoggedUserEntity> login(LoginFormEntity loginForm);
}
