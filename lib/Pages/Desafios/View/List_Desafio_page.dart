import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:testes_de_estudos/App/Styles/App_Styles.dart';
import 'package:testes_de_estudos/App/Widgets/Cards/Card_Desafio.dart';
import 'package:testes_de_estudos/App/Widgets/Cards/Card_Post.dart';
import 'package:testes_de_estudos/App/Widgets/Cards/Card_Select_Desafio.dart';
import 'package:testes_de_estudos/Pages/Desafios/Controller/Desafios_page_Controller.dart';
import 'package:testes_de_estudos/Pages/Desafios/View/Add_Desafio_Page.dart';
import 'package:testes_de_estudos/Pages/Desafios/View/Desafio_Fullscream.dart';

class ListaDeDesafios extends StatelessWidget {
  const ListaDeDesafios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Observer(builder: (context) {
              return Column(
                children: [
                  DesafioPageController.controller.desafioAtivo.isEmpty
                      ? SelectDesafioCard()
                      : DesafilCard(
                          onTap: () {
                            ShowDesafio().showDesafio(
                                desafio: DesafioPageController
                                    .controller.desafioAtivo[0],
                                context: context);
                          },
                          desafio:
                              DesafioPageController.controller.desafioAtivo[0],
                        ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      'Lista de Desafios',
                      style: TextStyle(
                        fontFamily: AppFontes.montserrat,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: DesafioPageController
                        .controller.desafiosNaoAtivos.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: DesafilCard(
                          desafio: DesafioPageController
                              .controller.desafiosNaoAtivos[index],
                        ),
                      );
                    },
                  ),
                ],
              );
            }),
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AddDesafioPage()),
            );
          },
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.add,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
