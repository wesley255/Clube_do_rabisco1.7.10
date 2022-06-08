import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:testes_de_estudos/App/Controller/AppController.dart';
import 'package:testes_de_estudos/App/Widgets/CaixaDeTexto.dart';
import 'package:testes_de_estudos/App/Widgets/CusttomButtom.dart';
import 'package:testes_de_estudos/Pages/Perfil/Controller/Perfil_Store.dart';
import 'package:testes_de_estudos/Pages/Perfil/Widgets/Perfil_AppBart.dart';
import 'package:testes_de_estudos/App/Widgets/CaixaDeTexto.dart';

class EditarPefil extends StatelessWidget {
  final PerfilStore perfilController = PerfilController.istance.controller;
  final AppController app;
  EditarPefil({required this.app});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Observer(builder: (context) {
      return SingleChildScrollView(
        child: Column(
          children: [
            PerfiAppBar(
              app: app,
              avatarIconButton: () {
                perfilController.getNewAvata();
              },
              backgrandedIconButton: () {
                perfilController.getNewbackgrandedImage();
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  BoxParmEditarPerfil(
                    controller: perfilController.newNickNamePerfilController,
                    titulo: 'Novo Nick',
                    margim: EdgeInsets.only(bottom: 20),
                    maxTextLeanth: 12,
                  ),
                  BoxParmEditarPerfil(
                    muiltline: 10,
                    heigth: 230,
                    controller: perfilController.newStoryPerfilController,
                    maxTextLeanth: 200,
                    titulo: 'Story',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CusttonButton(
                          width: 150,
                          borderColor: Colors.red,
                          labal: 'Cancelar',
                          ontap: () {
                            perfilController.changePageToPefil(context);
                          },
                        ),
                        CusttonButton(
                          width: 150,
                          labal: 'Salvar',
                          ontap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            perfilController.saveNewUserData(context,
                                newAvatar: perfilController.newAvataImagePerfil,
                                newback:
                                    perfilController.newBackgrandeImagePerfil,
                                newName: perfilController
                                    .newNickNamePerfilController.text,
                                newStory: perfilController
                                    .newStoryPerfilController.text);
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }));
  }
}

class BoxParmEditarPerfil extends StatelessWidget {
  final int? maxTextLeanth;
  final int? muiltline;
  final double? heigth;
  final String titulo;
  final TextEditingController? controller;
  final EdgeInsets? margim;
  const BoxParmEditarPerfil(
      {required this.titulo,
      this.maxTextLeanth,
      this.controller,
      this.margim,
      this.heigth,
      this.muiltline});
  @override
  Widget build(BuildContext context) {
    print('${controller?.text}');
    return Container(
      padding: EdgeInsets.all(20),
      margin: margim,
      height: heigth,
      width: double.infinity,
      color: Color(0xff010C10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: TextStyle(),
          ),
          CaixaDeTexto(
            maxLength: maxTextLeanth,
            controller: controller,
            color: Color(0xff010C10),
            textColor: Colors.white,
            muiltline: muiltline,
          )
        ],
      ),
    );
  }
}
