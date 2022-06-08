class UserData {
  final String nome;
  final String email;
  final String username;
  String avatar;
  String backperfil;
  String story;
  UserData({
    required this.username,
    this.avatar = '',
    this.backperfil = '',
    required this.email,
    required this.nome,
    this.story = '',
  });
}

class LoggedUserEntity {
  String? email;
  LoggedUserEntity({
    this.email,
  });
}

class LoginFormEntity {
  final String email;
  final String senha;
  LoginFormEntity({
    required this.email,
    required this.senha,
  });
}

class CadastroFormEntity {
  final String nickName;
  final String email;
  final String username;
  final String senha;
  final String confirmarSenha;
  CadastroFormEntity({
    required this.nickName,
    required this.email,
    required this.senha,
    required this.username,
    required this.confirmarSenha,
  });
}
