// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:testes_de_estudos/App/Styles/App_Styles.dart';
import 'package:testes_de_estudos/Pages/Desafios/View/Add_Desafio_Page.dart';

class Desafios extends StatefulWidget {
  const Desafios({Key? key}) : super(key: key);

  @override
  State<Desafios> createState() => _DesafiosState();
}

class _DesafiosState extends State<Desafios> {
  @override
  void initState() {
    a = ClockRemainingTime.getFuturedata(addtime: Duration(days: 5));
    _startRelogio();
    super.initState();
  }

  DateTime a = DateTime.now();
  _startRelogio() async {
    tempo.value = ClockRemainingTime.getdifferenceTime(dateTime: a);
    await Future.delayed(Duration(seconds: 1));
    _startRelogio();
  }

  ValueNotifier<String> tempo = ValueNotifier('');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(children: [
            ValueListenableBuilder(
                valueListenable: tempo,
                builder: (context, a, b) {
                  return DesafilCard(
                    titulo: 'looney tunes',
                    ativo: true,
                    teporestante: tempo.value,
                  );
                }),
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
                itemCount: urls.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: DesafilCard(
                      titulo: 'Cenarios',
                      ativo: false,
                    ),
                  );
                },
              ),
            ),
          ]),
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

class DesafilCard extends StatelessWidget {
  final String? url;
  final String titulo;
  final bool ativo;
  final String? teporestante;
  const DesafilCard({
    this.url,
    this.teporestante,
    required this.titulo,
    required this.ativo,
  });
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 394 / 178,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(10),
              image: url != null
                  ? DecorationImage(
                      image: NetworkImage(url!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    titulo.length > 10
                        ? '"${titulo.substring(0, 9)}..."'
                        : '"$titulo"',
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
                          '#$titulo',
                          style: TextStyle(
                            fontSize: ativo != true ? 20 : 14,
                            fontFamily: AppFontes.montserratExtraBold,
                          ),
                        ),
                        ativo != true ? SizedBox() : Text('$teporestante')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: ativo != true ? Color.fromRGBO(2, 12, 17, 0.75) : null,
          )
        ],
      ),
    );
  }
}

class ClockRemainingTime {
  static String getdifferenceTime({required DateTime dateTime}) {
    /*----------------------\/--[cache]--\/------------------------*/
    String _formart(int value) => '$value'.padLeft(2, '0');
    Duration resut = DateTime.now().difference(dateTime);
    bool ativo = DateTime.now().isBefore(dateTime);
    /*----------------------/\--[cache]--/\------------------------*/
    if (ativo) {
      String dia = _formart(resut.inDays * -1);
      String hora = _formart(resut.inHours.remainder(24) * -1);
      String minuto = _formart(resut.inMinutes.remainder(60) * -1);
      String segundo = _formart(resut.inSeconds.remainder(60) * -1);
      return '${dia}d : ${hora}h : ${minuto}m : ${segundo}s';
    } else {
      return 'Finalizado!';
    }
  }

  static DateTime getFuturedata({required Duration addtime}) {
    int timenow = DateTime.now().millisecondsSinceEpoch;
    return DateTime.fromMillisecondsSinceEpoch(
      timenow + addtime.inMilliseconds,
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
