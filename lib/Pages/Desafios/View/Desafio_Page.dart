// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:testes_de_estudos/App/Services/AppInstances.dart';
import 'package:testes_de_estudos/App/Widgets/CaixaDeTexto.dart';
import 'package:testes_de_estudos/App/Widgets/Cards/Card_Desafio.dart';
import 'package:testes_de_estudos/App/Widgets/Cards/Card_Post.dart';
import 'package:testes_de_estudos/App/Widgets/Cards/Card_Select_Desafio.dart';
import 'package:testes_de_estudos/App/Widgets/UserCircularAvatar.dart';
import 'package:testes_de_estudos/Pages/Desafios/Controller/Desafios_page_Controller.dart';
import 'package:testes_de_estudos/Pages/Desafios/View/List_Desafio_Page.dart';

class Desafios extends StatefulWidget {
  const Desafios({Key? key}) : super(key: key);

  @override
  State<Desafios> createState() => _DesafiosState();
}

class _DesafiosState extends State<Desafios> {
  @override
  void initState() {
    DesafioPageController.controller.getListDesafios();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ListaDeDesafios(),
                              ),
                            );
                          },
                          desafio:
                              DesafioPageController.controller.desafioAtivo[0],
                        ),
                  DesafioPageController.controller.desafiovalido
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              UserCircularAvatar(
                                  user: AppSevices.appController.getMyUser()),
                              const Expanded(child: SizedBox()),
                              Container(
                                constraints:
                                    const BoxConstraints(maxHeight: 150),
                                child: CaixaDeTexto(
                                  controller: DesafioPageController
                                      .controller.desafioPostTextComtroller,
                                  heith: 15,
                                  heathFlacsivo: true,
                                  bordertopLaft: 0,
                                  icon: const Icon(
                                    Icons.image,
                                    color: Colors.lightBlue,
                                    size: 30,
                                  ),
                                  iconClick: () {
                                    DesafioPageController.controller
                                        .selectDesafioImagePost(context);
                                  },
                                  width: MediaQuery.of(context).size.width /
                                      100 *
                                      80,
                                ),
                              ),
                            ],
                          ),
                        )
                      : SizedBox(),
                  Container(
                    height: 2,
                    width: double.infinity,
                    color: Color(0xff18455E),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: DesafioPageController
                        .controller.getListPostDoDesafio.length,
                    itemBuilder: (context, index) {
                      int listlength = DesafioPageController
                          .controller.getListPostDoDesafio.length;
                      return Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CardPost(
                          post: DesafioPageController.controller
                              .getListPostDoDesafio[(listlength - 1) - index],
                        ),
                      );
                    },
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

List<String> urls = [
  'https://http2.mlstatic.com/D_NQ_NP_617526-MLB41004456582_032020-O.jpg',
  'https://upload.wikimedia.org/wikipedia/pt/9/96/Tvglobinho_logo.jpg',
  'https://escolazion.com/blogz/wp-content/uploads/2019/10/blog.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBPh2qaTEjMh9-YTkIWMkBX0vV_8-Znha2AA&usqp=CAU'
      'https://t.ctcdn.com.br/EZhvpCxKq-h-JpECGdHNe_I8KKQ=/512x288/smart/filters:format(webp)/i517013.png'
];
