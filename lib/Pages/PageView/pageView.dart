import 'package:flutter/material.dart';
import 'package:testes_de_estudos/Pages/Desafios/View/desafios.dart';
import 'package:testes_de_estudos/Pages/Home/Home_Page.dart';
import 'package:testes_de_estudos/Pages/Perfil/Perfil_page.dart';

class Pages extends StatefulWidget {
  const Pages({Key? key}) : super(key: key);

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  final pagesController = PageController(initialPage: 1);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                flex: 12,
                child: PageView(
                  controller: pagesController,
                  children: [
                    Desafios(),
                    HomePage(),
                    PerfilPage(isVisitantPefilPage: false),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: AnimatedBuilder(
                    animation: pagesController,
                    builder: (context, snapshot) {
                      return BottomNavigationBar(
                        showSelectedLabels: false,
                        showUnselectedLabels: false,
                        backgroundColor: Color(0xff113043),
                        selectedItemColor: Color(0xffEAEAEA),
                        unselectedItemColor: Color(0xff777777),
                        currentIndex: pagesController.page?.round() ?? 1,
                        onTap: (index) {
                          pagesController.animateToPage(index,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease);
                        },
                        // ignore: prefer_const_literals_to_create_immutables
                        items: [
                          BottomNavigationBarItem(
                              icon: Icon(
                                Icons.ac_unit,
                                size: 33,
                              ),
                              label: ''),
                          BottomNavigationBarItem(
                              icon: Icon(
                                Icons.home,
                                size: 33,
                              ),
                              label: ''),
                          BottomNavigationBarItem(
                              icon: Icon(
                                Icons.person,
                                size: 33,
                              ),
                              label: '')
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
