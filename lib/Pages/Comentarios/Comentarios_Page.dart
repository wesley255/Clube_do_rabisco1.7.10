import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:testes_de_estudos/App/Controller/AppController.dart';
import 'package:testes_de_estudos/App/Data_Source/Domain/Entities/Comentario_Entitie.dart';
import 'package:testes_de_estudos/App/Data_Source/Domain/Entities/Post.dart';

import 'package:testes_de_estudos/App/Services/AppInstances.dart';
import 'package:testes_de_estudos/App/Widgets/UserCircularAvatar.dart';
import 'package:testes_de_estudos/Pages/Comentarios/Controller/ComentarioPageController.dart';
import 'package:testes_de_estudos/App/Widgets/CaixaDeTexto.dart';

import 'package:testes_de_estudos/App/Styles/App_Styles.dart';
import 'package:testes_de_estudos/App/Widgets/RandomColor.dart';
import 'package:testes_de_estudos/App/Widgets/Show_Full_Image.dart';

class AppInstaces {
  static ComentarioPageController comentarioPageController =
      ComentarioPageController();
}

class _CardComentario extends StatefulWidget {
  final Post post;
  const _CardComentario({required this.post});
  @override
  State<_CardComentario> createState() => _CardComentarioState();
}

class _CardComentarioState extends State<_CardComentario> {
  final AppController app = AppSevices.appController;
  final ComentarioPageController thispageController =
      ComentarioPageController();
  @override
  void initState() {
    super.initState();
    thispageController.inicalizeListPost(widget.post.id);
  }

  @override
  void dispose() {
    super.dispose();
    AppInstaces.comentarioPageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20),
      titlePadding: EdgeInsets.zero,
      title: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height / 100 * 60,
          width: MediaQuery.of(context).size.width,
          color: Color(0xFF081720),
          child: Column(
            children: [
              /*--------------------------------------------------*/
              Table(
                children: [
                  TableRow(
                    children: [
                      Column(children: [
                        Row(
                          children: [
                            UserCircularAvatar(
                                user: app.mapListUsers[widget.post.user]!),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text:
                                          '${app.mapListUsers[widget.post.user]!.nome}\n'),
                                  TextSpan(
                                    text: app.mapListUsers[widget.post.user]!
                                        .username,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: AppFontes.montserrat),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Container(
                          constraints: BoxConstraints(
                            maxHeight:
                                MediaQuery.of(context).size.height / 100 * 16,
                          ),
                          child: SingleChildScrollView(
                            child: Text(
                              widget.post.label,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: AppFontes.montserrat),
                            ),
                          ),
                        ),
                      ]),
                      Container(
                        constraints: BoxConstraints(
                          maxHeight:
                              MediaQuery.of(context).size.height / 100 * 25,
                        ),
                        child: AspectRatio(
                          aspectRatio: double.parse(
                                  widget.post.image[0]['width'].toString()) /
                              double.parse(
                                  widget.post.image[0]['heigth'].toString()),
                          child: Container(
                            margin: EdgeInsets.all(8),
                            color: RandomColor().call(),
                            child:
                                ImageClick(url: widget.post.image[0]['url']!),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Expanded(
                child: Observer(
                  builder: (context) {
                    List<ComentariosForm> _listComentarios =
                        AppInstaces.comentarioPageController.getlistComentarios;
                    return ListView.builder(
                      shrinkWrap: false,
                      reverse: true,
                      itemCount: _listComentarios.length,
                      itemBuilder: (context, index) {
                        ComentariosForm doc = _listComentarios[
                            (_listComentarios.length - 1) - index];

                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  UserCircularAvatar(user: app.getMyUser()),
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    constraints: BoxConstraints(
                                        minWidth: 100,
                                        maxWidth:
                                            MediaQuery.of(context).size.width /
                                                100 *
                                                70),
                                    decoration: BoxDecoration(
                                      color: doc.color,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        bottomLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                      ),
                                    ),
                                    padding: EdgeInsets.all(5),
                                    child: Text(doc.comentario),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              CaixaDeTexto(
                controller: thispageController.controller,
                margem: EdgeInsets.all(10),
                icon: Icon(
                  Icons.send,
                  color: Colors.lightBlue,
                ),
                iconClick: () {
                  thispageController.comentar(
                    comentario: thispageController.controller.text,
                    postid: widget.post.id,
                  );
                  thispageController.controller.clear();
                },
              ),

              /*--------------------------------------------------*/
            ],
          ),
        ),
      ),
    );
  }
}

class ShowComentorio {
  Future<void> showComentario({
    required AppController app,
    required Post post,
    required BuildContext context,
  }) async {
    return showDialog<void>(
      barrierColor: Color.fromRGBO(13, 13, 13, 0.9),
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return _CardComentario(post: post);
      },
    );
  }
}
