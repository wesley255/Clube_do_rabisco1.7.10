// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:testes_de_estudos/App/Widgets/Cards/Card_Desafio.dart';
import 'package:testes_de_estudos/App/Widgets/Cards/Card_Select_Desafio.dart';

import 'package:testes_de_estudos/App/src/Desadios/Domain/Entitys/Desafio_Entity.dart';
import 'package:testes_de_estudos/App/Styles/App_Styles.dart';
import 'package:testes_de_estudos/Pages/Desafios/Controller/Desafios_page_Controller.dart';
import 'package:testes_de_estudos/Pages/Desafios/View/Add_Desafio_Page.dart';

import '../../../App/LocalServices/set_Clock.dart';

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
          child: Observer(builder: (context) {
            return Column(
              children: [
                DesafioPageController.controller.desafioAtivo.isEmpty
                    ? SelectDesafioCard()
                    : DesafilCard(
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
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
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
                ),
              ],
            );
          }),
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

List<String> urls = [
  'https://http2.mlstatic.com/D_NQ_NP_617526-MLB41004456582_032020-O.jpg',
  'https://upload.wikimedia.org/wikipedia/pt/9/96/Tvglobinho_logo.jpg',
  'https://escolazion.com/blogz/wp-content/uploads/2019/10/blog.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBPh2qaTEjMh9-YTkIWMkBX0vV_8-Znha2AA&usqp=CAU'
      'https://t.ctcdn.com.br/EZhvpCxKq-h-JpECGdHNe_I8KKQ=/512x288/smart/filters:format(webp)/i517013.png'
];
