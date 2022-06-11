import 'package:flutter/material.dart';
import 'package:testes_de_estudos/App/LocalServices/set_Clock.dart';
import 'package:testes_de_estudos/App/Styles/App_Styles.dart';
import 'package:testes_de_estudos/App/src/Desadios/Domain/Entitys/Desafio_Entity.dart';
import 'package:testes_de_estudos/Pages/Desafios/Controller/Desafios_page_Controller.dart';
import 'package:testes_de_estudos/Pages/Desafios/View/Desafio_Fullscream.dart';

class DesafilCard extends StatefulWidget {
  final bool? fullScrean;
  final DesafioEntity desafio;
  const DesafilCard({required this.desafio, this.fullScrean});

  @override
  State<DesafilCard> createState() => _DesafilCardState();
}

class _DesafilCardState extends State<DesafilCard> {
  ValueNotifier<String> tempo = ValueNotifier('Finalizado');
  ValueNotifier<bool> finalizado = ValueNotifier(true);

  int i = 0;
  bool isFullScream = false;
  _startTime() async {
    DateTime a = DateTime.now();
    finalizado.value = a.toUtc().isBefore(widget.desafio.prozo);

    if (finalizado.value) {
      tempo.value =
          ClockRemainingTime.getdifferenceTime(dateTime: widget.desafio.prozo);
    } else {
      tempo.value = 'Finalizado';
    }

    await Future.delayed(Duration(seconds: 1));
    _startTime();
  }

  @override
  void initState() {
    _startTime();
    isFullScream = widget.fullScrean ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          if (widget.fullScrean != true) {
            ShowDesafio()
                .showDesafio(desafio: widget.desafio, context: context);
          }
        },
        child: Container(
          padding: isFullScream ? EdgeInsets.all(10) : null,
          color: Color(0xff081720),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: AspectRatio(
                  aspectRatio: 394 / 178,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          image: DecorationImage(
                            image: NetworkImage(widget.desafio.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                              child: Text(
                                widget.desafio.titulo.length > 10
                                    ? '${widget.desafio.titulo.substring(0, 9)}...'
                                    : widget.desafio.titulo,
                                style: TextStyle(
                                    fontSize: 48,
                                    fontFamily: AppFontes.montserratExtraBold,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 10,
                                        color: Colors.black,
                                        offset: Offset(2, 3),
                                      )
                                    ]),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                color: Color.fromRGBO(2, 12, 17, 0.75),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.desafio.tag,
                                      style: TextStyle(
                                        fontSize: widget.desafio.ativo != true
                                            ? 20
                                            : 14,
                                        fontFamily:
                                            AppFontes.montserratExtraBold,
                                      ),
                                    ),
                                    ValueListenableBuilder(
                                      valueListenable: tempo,
                                      builder: (_, a, b) {
                                        return widget.desafio.ativo != true
                                            ? SizedBox()
                                            : Text(tempo.value);
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      isFullScream
                          ? SizedBox()
                          : Container(
                              color: widget.desafio.ativo != true
                                  ? Color.fromRGBO(2, 12, 17, 0.75)
                                  : null,
                            ),
                      ValueListenableBuilder(
                        valueListenable: finalizado,
                        builder: (a, b, _) {
                          return (!widget.desafio.ativo)
                              ? SizedBox()
                              : finalizado.value
                                  ? SizedBox()
                                  : Positioned(
                                      bottom: 5,
                                      right: 10,
                                      child: GestureDetector(
                                        onTap: () async {
                                          await DesafioPageController.controller
                                              .seletcDesafio(
                                                  tag: widget.desafio.tag);
                                          _startTime();
                                        },
                                        child: CircleAvatar(
                                          backgroundColor: Colors.grey,
                                          child:
                                              Icon(Icons.play_circle_outline),
                                        ),
                                      ),
                                    );
                        },
                      )
                    ],
                  ),
                ),
              ),
              isFullScream == true
                  ? Container(
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      color: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Text(
                              'Regras do desafio',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: AppFontes.montserrat,
                                  color: Color(0xff787878)),
                            ),
                          ),
                          Text(widget.desafio.regras),
                        ],
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
