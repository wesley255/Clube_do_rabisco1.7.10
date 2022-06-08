// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_element, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:testes_de_estudos/App/Widgets/CusttomButtom.dart';
import 'package:testes_de_estudos/App/Widgets/CaixaDeTexto.dart';
import 'Controller/LoginController.dart';
import 'login_wigets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    loginController.resetFrom();
  }

  final LoginController loginController = LoginControllerSevices.loginSevices;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (context) {
        return SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          reverse: !loginController.islogin,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Login_Backgrande_Widget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Login_Titulo_Widget(),

                  //
                  loginController.islogin
                      ? SizedBox()
                      : CaixaDeTexto(
                          maxLength: 12,
                          label: loginController.parm.nicklabel,
                          labelColor:
                              loginController.parm.nicklabel != 'Apelido'
                                  ? Colors.red
                                  : null,
                          controller: loginController.parm.nickController,
                          margem: EdgeInsets.only(top: 10),
                          heith: 15,
                        ),
                  loginController.islogin
                      ? SizedBox()
                      : CaixaDeTexto(
                          maxLength: 17,
                          label: loginController.parm.userNameLabel,
                          labelColor:
                              loginController.parm.userNameLabel != '@User_name'
                                  ? Colors.red
                                  : null,
                          controller: loginController.parm.usernameController,
                          margem: EdgeInsets.only(top: 10),
                          heith: 15,
                          onChanged: (text) {
                            if (text.isNotEmpty) {
                              if (text.substring(0, 1) != '@') {
                                String value = loginController
                                    .parm.usernameController.text;
                                loginController.parm.usernameController.text =
                                    '@${value.substring(0, value.length)}';
                                loginController.parm.usernameController
                                    .selection = TextSelection.fromPosition(
                                  TextPosition(
                                    offset: loginController
                                        .parm.usernameController.text.length,
                                  ),
                                );
                              }
                            }
                          },
                        ),
                  //
                  //
                  //

                  CaixaDeTexto(
                    label: loginController.parm.emailLabel,
                    labelColor: loginController.parm.emailLabel != 'Gmail.com'
                        ? Colors.red
                        : null,
                    margem: EdgeInsets.only(top: 10),
                    heith: 15,
                    controller: loginController.parm.emailController,
                  ),
                  //
                  //
                  //
                  CaixaDeTexto(
                    label: loginController.parm.senhaLabel,
                    labelColor: loginController.parm.senhaLabel != 'Senha'
                        ? Colors.red
                        : null,
                    controller: loginController.parm.senhaController,
                    obiscureText: !loginController.exibirSenha,
                    margem: EdgeInsets.only(top: 10),
                    heith: 15,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  //
                  //
                  //
                  loginController.islogin
                      ? SizedBox()
                      : CaixaDeTexto(
                          label: loginController.parm.cSenhalabel,
                          labelColor: loginController.parm.cSenhalabel !=
                                  'Confirmar Senha'
                              ? Colors.red
                              : null,
                          controller: loginController.parm.cSenhaController,
                          obiscureText: !loginController.exibirSenha,
                          margem: EdgeInsets.only(top: 10),
                          heith: 15,
                          keyboardType: TextInputType.visiblePassword,
                        ),

                  Login_CheckBox_widget(),

                  CusttonButton(
                    labal: loginController.islogin ? 'Login' : 'Cadastrar',
                    ontap: () {
                      if (loginController.islogin) {
                        loginController.login(context);
                      } else {
                        loginController.cadastrar(context);
                      }
                    },
                    fontSize: 24,
                  ),

                  Expanded(child: Container()),
                  Login_ButtonLabel_ChangePage_widget(),
                  SizedBox(height: 20)
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

//


  