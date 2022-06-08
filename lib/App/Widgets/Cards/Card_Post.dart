// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:testes_de_estudos/App/Controller/AppController.dart';

import 'package:testes_de_estudos/App/Data_Source/Domain/Entities/Post.dart';
import 'package:testes_de_estudos/App/LocalServices/Formate_Data.dart';
import 'package:testes_de_estudos/App/Services/AppInstances.dart';
import 'package:testes_de_estudos/App/Styles/App_Styles.dart';
import 'package:testes_de_estudos/App/Widgets/Cards/Card_Comentario.dart';

import 'package:testes_de_estudos/App/Widgets/RandomColor.dart';
import 'package:testes_de_estudos/App/Widgets/UserCircularAvatar.dart';

import 'package:testes_de_estudos/App/Widgets/Show_Full_Image.dart';
import 'package:testes_de_estudos/Pages/Comentarios/Comentarios_Page.dart';

class CardPost extends StatelessWidget {
  Post post;
  CardPost({required this.post});
  FormarDataContrect formatedata = FormatDateTime();
  AppController app = AppSevices.appController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10, right: 5),
                child: UserCircularAvatar(
                  user: app.mapListUsers[post.user]!,
                ),
              ),
              Observer(builder: (context) {
                return Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${app.mapListUsers[post.user]!.nome}\n',
                      ),
                      TextSpan(text: app.mapListUsers[post.user]!.username),
                    ],
                  ),
                );
              }),

              //
              const Expanded(child: SizedBox()),

              //
              Text(formatedata.formateDate(data: post.data))
            ],
          ),
          post.label != ''
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  constraints: const BoxConstraints(maxHeight: 100),
                  child: Text(post.label),
                )
              : const SizedBox(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AspectRatio(
                aspectRatio: double.parse(post.image[0]['width'].toString()) /
                    double.parse(post.image[0]['heigth'].toString()),
                child: Container(
                  color: RandomColor().call(),
                  child: ImageClick(url: post.image[0]['url']!),
                ),
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  if (post.favorios.contains(app.loggedUser?.email)) {
                    AppSevices.userActions.tirarlike(
                      postId: post.id,
                      userEmail: app.getMyUser().email,
                    );
                  } else {
                    AppSevices.userActions.darlike(
                      postId: post.id,
                      userEmail: app.getMyUser().email,
                    );
                  }
                },
                icon: Icon(Icons.heart_broken_outlined,
                    color: post.favorios.contains(app.loggedUser?.email)
                        ? Colors.red
                        : null),
              ),
              Text('${post.favorios.length}'),
              /*----------------------------------------------------------------------------------*/
              IconButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  var value = ShowComentorio();
                  value.showComentario(app: app, post: post, context: context);
                },
                icon: const Icon(Icons.chat_bubble_outline_rounded),
              ),
              Text('${post.nComentarios}'),
              /*---------------------------------------------------------------------------------*/
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send_rounded),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            width: double.infinity,
            height: 2,
            color: const Color(0xff18455E),
          ),
        ],
      ),
    );
  }
}
