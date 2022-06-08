import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:testes_de_estudos/App/Services/AppInstances.dart';
import 'package:testes_de_estudos/App/Widgets/Cards/Card_App_Loading.dart';
import 'package:testes_de_estudos/Pages/Login/login_page.dart';
import 'package:testes_de_estudos/Pages/PageView/pageView.dart';

class AuthCheckPage extends StatefulWidget {
  const AuthCheckPage({Key? key}) : super(key: key);

  @override
  State<AuthCheckPage> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheckPage> {
  final app = AppSevices.appController;

  @override
  void initState() {
    super.initState();
    AppSevices.appController.inicializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        if (app.appLoading) {
          return const CardAppLoading();
        }
        if (app.loggedUser == null) {
          return const LoginPage();
        }
        return const Pages();
      }),
    );
  }
}
