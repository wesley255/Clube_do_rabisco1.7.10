import 'package:flutter/material.dart';
import 'package:testes_de_estudos/Pages/Desafios/Controller/Desafios_page_Controller.dart';

class SelectDesafioCard extends StatelessWidget {
  const SelectDesafioCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: AspectRatio(
            aspectRatio: 394 / 178,
            child: InteractiveViewer(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.brown,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: IconButton(
            onPressed: () {
              DesafioPageController.controller.seletcDesafio();
            },
            icon: Icon(
              Icons.play_arrow,
              size: 30,
            ),
          ),
        )
      ],
    );
  }
}
