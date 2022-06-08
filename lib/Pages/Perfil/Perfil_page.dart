import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:testes_de_estudos/App/Controller/AppController.dart';
import 'package:testes_de_estudos/App/Services/AppInstances.dart';

import 'package:testes_de_estudos/Pages/Perfil/Controller/Perfil_Store.dart';
import 'package:testes_de_estudos/Pages/Perfil/Widgets/Pefil_Body.dart';

import 'package:testes_de_estudos/Pages/Perfil/Widgets/Perfil_AppBart.dart';

class PerfilPage extends StatelessWidget {
  final String? visitanteEmail;
  final bool isVisitantPefilPage;
  PerfilPage({this.visitanteEmail, required this.isVisitantPefilPage});
  final AppController app = AppSevices.appController;
  final perfilController = PerfilController.istance.controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onDoubleTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PerfiAppBar(
                visitanteEmail: visitanteEmail,
                app: app,
              ),
              PerfilBoby(
                visitanteEmail: visitanteEmail,
                perfilController: perfilController,
                app: app,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
