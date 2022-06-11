class AuthExeption implements Exception {
  final String? nameError;
  final String? confirmarSenhaError;
  final String? emailError;
  final String? senhaError;
  final String? userNameError;
  const AuthExeption({
    this.emailError,
    this.senhaError,
    this.userNameError,
    this.confirmarSenhaError,
    this.nameError,
  });
}
