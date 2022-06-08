// ignore_for_file: use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../App/LocalServices/Screen_Percent.dart';
import 'Controller/LoginController.dart';

class Login_Titulo_Widget extends StatelessWidget {
  const Login_Titulo_Widget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: alturaDaTela(context, 25),
        ),
        Center(
          child: Image.asset(
            'images/logo.png',
            scale: 1,
          ),
        ),
        const Center(
          child: Text(
            'Clube do Rabisco',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}

//adiciona uma foto no fundo e tira o teclado quando toca fora\/
class Login_Backgrande_Widget extends StatelessWidget {
  final Widget child;
  const Login_Backgrande_Widget({required this.child});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: larguraDaTela(context, 8)),
        height: alturaDaTela(context, 100),
        width: larguraDaTela(context, 100),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/backgrond.png'), fit: BoxFit.cover),
        ),
        child: child,
      ),
    );
  }
}

final loginContro = LoginControllerSevices.loginSevices;

class Login_ButtonLabel_ChangePage_widget extends StatelessWidget {
  const Login_ButtonLabel_ChangePage_widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          loginContro.changePage();
        },
        child: Observer(builder: (_) {
          return Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: loginContro.islogin
                        ? 'Ainda Não Tenho Conta\n'
                        : 'Voltar para\n'),
                TextSpan(
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  text:
                      loginContro.islogin ? 'CRIAR UMA AGORA' : 'TELA DE LOGIN',
                ),
              ],
            ),
            textAlign: TextAlign.center,
          );
        }),
      ),
    );
  }
}

class Login_CheckBox_widget extends StatelessWidget {
  Login_CheckBox_widget({Key? key}) : super(key: key);
  final loginController = LoginControllerSevices.loginSevices;
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Checkbox(
              value: loginController.exibirSenha,
              onChanged: (value) {
                loginController.mostraououcutarSenha(value!);
              },
            ),
            loginController.exibirSenha
                ? const Text('Olcutar Senha')
                : const Text('Exibir Senha')
          ],
        );
      },
    );
  }
}
