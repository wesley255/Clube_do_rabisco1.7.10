import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:testes_de_estudos/App/LocalServices/Entities/ImageDataEntitie.dart';
import 'package:testes_de_estudos/App/Styles/App_Styles.dart';
import 'package:testes_de_estudos/App/Widgets/CusttomButtom.dart';
import 'package:testes_de_estudos/App/Widgets/UserCircularAvatar.dart';
import 'package:testes_de_estudos/App/src/Auth/Domain/Entities/UserEntitie.dart';
import 'package:testes_de_estudos/Pages/Home/controller/HomeStore.dart';
import 'package:testes_de_estudos/App/Widgets/CaixaDeTexto.dart';

class CardSelectImagePostWidget {
  void Function() buttonAction;
  final HomeStore homeController = HomeController.instance.controller;
  final BuildContext context;
  final UserData user;
  final TextEditingController textController;
  final LocalImage imageSoucer;
  final String? tag;
  CardSelectImagePostWidget({
    this.tag,
    required this.buttonAction,
    required this.textController,
    required this.user,
    required this.context,
    required this.imageSoucer,
  });
  claseCard() {
    Navigator.pop(context);
  }

  Future<void> showMyDialog() {
    return showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              titlePadding: EdgeInsets.zero,
              title: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xff081720),
                ),
                width: MediaQuery.of(context).size.width / 100 * 95,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: UserCircularAvatar(
                            user: user,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '${user.nome}\n',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              TextSpan(
                                text: user.email,
                                style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        IconButton(
                          onPressed: () => claseCard(),
                          icon: const Icon(Icons.close),
                        )
                      ],
                    ),
                    tag != null
                        ? Text(
                            tag!,
                            style: TextStyle(
                              color: Color(0xff4FC0FF),
                              fontFamily: AppFontes.montserrat,
                              fontSize: 18,
                            ),
                          )
                        : SizedBox(),
                    Container(
                      constraints: const BoxConstraints(maxHeight: 100),
                      child: CaixaDeTexto(
                        controller: textController,
                        heathFlacsivo: true,
                      ),
                    ),
                    Image.file(imageSoucer.image),
                    SizedBox(height: 10),
                    Center(
                      child: CusttonButton(
                        labal: 'Postar',
                        ontap: buttonAction,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
