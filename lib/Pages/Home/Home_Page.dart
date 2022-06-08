import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:testes_de_estudos/App/Controller/AppController.dart';
import 'package:testes_de_estudos/App/Data_Source/Domain/Entities/Post.dart';
import 'package:testes_de_estudos/App/Services/AppInstances.dart';
import 'package:testes_de_estudos/App/Widgets/Cards/Card_Post.dart';
import 'package:testes_de_estudos/App/Widgets/UserCircularAvatar.dart';
import 'package:testes_de_estudos/Pages/Home/controller/HomeStore.dart';
import 'package:testes_de_estudos/App/Widgets/CaixaDeTexto.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomeState();
}

TextEditingController a = TextEditingController();

class _HomeState extends State<HomePage> {
  final AppController app = AppSevices.appController;
  final HomeStore homeController = HomeController.instance.controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 5),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    UserCircularAvatar(user: app.getMyUser()),
                    const Expanded(child: SizedBox()),
                    Container(
                      constraints: const BoxConstraints(maxHeight: 150),
                      child: CaixaDeTexto(
                        controller: homeController.homeTextController,
                        heith: 15,
                        heathFlacsivo: true,
                        bordertopLaft: 0,
                        icon: const Icon(
                          Icons.image,
                          color: Colors.lightBlue,
                          size: 30,
                        ),
                        iconClick: () {
                          homeController.selectHomeImagePost(context);
                        },
                        width: MediaQuery.of(context).size.width / 100 * 80,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Observer(
                    builder: (context) {
                      List<Post> postList = app.mapListPosts.values.toList();
                      return ListView.builder(
                        itemCount: postList.length,
                        itemBuilder: (context, index) {
                          return CardPost(
                              post: postList[postList.length - 1 - index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
