import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:testes_de_estudos/App/Auth/Domain/Entities/UserEntitie.dart';
import 'package:testes_de_estudos/App/Auth/Domain/Errors/AuthExepition.dart';

import 'package:testes_de_estudos/App/Services/AppInstances.dart';
import 'package:testes_de_estudos/App/Widgets/Cards/Card_loading.dart';

part 'LoginController.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  /*---------------------\/-[instance]-\/--------------------------*/
  final authService = AppSevices.auth;
  /*---------------------/\-[instance]-/\--------------------------*/
  @observable
  bool islogin = true;
  @observable
  bool exibirSenha = false;
  @observable
  LoginParmController parm = LoginParmController();
  //
  @observable
  String test = 'Gmail.com';

  @action
  void mostraououcutarSenha(bool valuee) {
    exibirSenha = valuee;
  }

  @action
  void changePage() {
    islogin = !islogin;
    resetFrom();
  }

  void resetFrom() {
    parm.nickController.clear();
    parm.emailController.clear();
    parm.senhaController.clear();
    parm.cSenhaController.clear();
    parm.usernameController.clear();
    parm.nicklabel = 'Apelido';
    parm.cSenhalabel = 'Confirmar Senha';
    parm.emailLabel = 'Gmail.com';
    parm.senhaLabel = 'Senha';
    parm.userNameLabel = '@User_name';
  }

  @action
  login(BuildContext context) async {
    /*----------------------[cash]----------------------*/
    CardLoading _card = CardLoading(context: context);
    FocusScope.of(context).requestFocus(FocusNode());
    LoginFormEntity loginfrom = LoginFormEntity(
      email: parm.emailController.text,
      senha: parm.senhaController.text,
    );
    /*----------------------[cash]----------------------*/
    _card.showMyDialog('Entrando', false);
    var result = await AppSevices.auth.login.login(loginfrom);

    result.fold(
      (error) {
        _card.claseCard();
        _exibirError(error);
      },
      (user) {
        _card.claseCard();
      },
    );
  }

  @action
  cadastrar(BuildContext context) async {
    /*----------------------[cash]----------------------*/
    CardLoading _card = CardLoading(context: context);
    FocusScope.of(context).requestFocus(FocusNode());
    CadastroFormEntity cadastroForm = CadastroFormEntity(
        email: parm.emailController.text,
        senha: parm.senhaController.text,
        nickName: parm.nickController.text,
        confirmarSenha: parm.cSenhaController.text,
        username: parm.usernameController.text);
    /*----------------------[cash]----------------------*/
    _card.showMyDialog('Entrando', false);
    var result = await AppSevices.auth.register.cadastra(cadastroForm);
    result.fold(
      (error) {
        _card.claseCard();
        _exibirError(error);
      },
      (user) {
        _card.claseCard();
      },
    );
  }

  void _exibirError(AuthExeption error) {
    if (error.nameError != null) {
      parm.nickController.clear();
      parm.nicklabel = error.nameError;
      parm = parm;
    }
    if (error.emailError != null) {
      parm.emailLabel = error.emailError;
      parm.emailController.clear();
      parm = parm;
    }
    if (error.userNameError != null) {
      parm.userNameLabel = error.userNameError;
      parm.usernameController.clear();
      parm = parm;
      print(error.userNameError);
    }
    if (error.senhaError != null) {
      parm.senhaController.clear();
      parm.senhaLabel = error.senhaError;
      parm = parm;
    }
    if (error.confirmarSenhaError != null) {
      parm.cSenhaController.clear();
      parm.cSenhalabel = error.confirmarSenhaError;
      parm = parm;
    }
  }
}

class LoginControllerSevices {
  static final LoginController loginSevices = LoginController();
}

class LoginParmController {
  String? nicklabel;
  String? emailLabel;
  String? senhaLabel;
  String? cSenhalabel;
  String? userNameLabel;
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController nickController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController cSenhaController = TextEditingController();
  LoginParmController({
    this.nicklabel = 'Apelido',
    this.cSenhalabel = 'Confirmar Senha',
    this.emailLabel = 'Gmail.com',
    this.senhaLabel = 'Senha',
    this.userNameLabel = '@User_name',
  });
}
