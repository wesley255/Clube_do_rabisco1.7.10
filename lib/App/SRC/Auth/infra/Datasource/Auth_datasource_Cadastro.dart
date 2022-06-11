import '../../Domain/Entities/UserEntitie.dart';

abstract class AuthdatasourceCadastroContract {
  Future cadastrar(CadastroFormEntity formCadastro);
}
