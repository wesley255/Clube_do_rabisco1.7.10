import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:testes_de_estudos/App/Controller/AppController.dart';
import 'package:testes_de_estudos/App/Widgets/ButtonGetImage.dart';
import 'package:testes_de_estudos/App/Widgets/UserCircularAvatar.dart';

import 'package:testes_de_estudos/Pages/Perfil/Controller/Perfil_Store.dart';

class PerfiAppBar extends StatelessWidget {
  final String? visitanteEmail;
  final AppController app;
  final VoidCallback? avatarIconButton;
  final VoidCallback? backgrandedIconButton;
  final perfilController = PerfilController.istance.controller;
  PerfiAppBar({
    this.visitanteEmail,
    required this.app,
    this.avatarIconButton,
    this.backgrandedIconButton,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Observer(builder: (context) {
        return Stack(
          children: [
            Positioned(
              child: visitanteEmail == null
                  ? Container(
                      margin: EdgeInsets.only(bottom: 50),
                      decoration: BoxDecoration(
                        color: Colors.brown[600],
                        image: perfilController.newBackgrandeImagePerfil != null
                            ? DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(
                                  perfilController
                                      .newBackgrandeImagePerfil!.image,
                                ),
                              )
                            : app.getMyUser().backperfil != ''
                                ? DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        app.getMyUser().backperfil),
                                  )
                                : null,
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(bottom: 50),
                      decoration: BoxDecoration(
                        color: Colors.brown[600],
                        image:
                            app.mapListUsers[visitanteEmail]!.backperfil != ''
                                ? DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(app
                                        .mapListUsers[visitanteEmail]!
                                        .backperfil),
                                  )
                                : null,
                      ),
                    ),
            ),
            Positioned(
              bottom: 0,
              left: 10,
              child: Row(
                children: [
                  UserCircularAvatar(
                    travarClick: true,
                    fileImage: perfilController.newAvataImagePerfil?.image,
                    margin: EdgeInsets.only(right: 10),
                    size: 100,
                    user: visitanteEmail != null
                        ? app.mapListUsers[visitanteEmail]!
                        : app.getMyUser(),
                  ),
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text:
                            '${visitanteEmail != null ? app.mapListUsers[visitanteEmail]!.nome : app.getMyUser().nome} \n',
                        style: pefilNameTextStyle,
                      ),
                      TextSpan(
                          text: visitanteEmail != null
                              ? app.mapListUsers[visitanteEmail]!.username
                              : app.getMyUser().username,
                          style: pefilemailTextStyle),
                    ]),
                  )
                ],
              ),
            ),
            backgrandedIconButton != null
                ? Positioned(
                    right: 10,
                    bottom: 25,
                    child: ButtonGetImage(
                      radius: 25,
                      onTap: backgrandedIconButton,
                    ),
                  )
                : SizedBox(),
            avatarIconButton != null
                ? Positioned(
                    left: 60,
                    bottom: 0,
                    child: ButtonGetImage(
                      radius: 25,
                      onTap: avatarIconButton,
                    ),
                  )
                : SizedBox(),
          ],
        );
      }),
    );
  }
}

TextStyle pefilNameTextStyle = TextStyle(
  fontSize: 36,
  fontWeight: FontWeight.w900,
  fontFamily: 'Montserrat',
  shadows: <Shadow>[
    Shadow(
      blurRadius: 4,
      color: Color.fromRGBO(0, 0, 0, 0.5),
      offset: Offset(2, 2),
    )
  ],
);

TextStyle pefilemailTextStyle = TextStyle(
  fontWeight: FontWeight.w900,
  fontFamily: 'Montserrat',
  shadows: <Shadow>[
    Shadow(
      blurRadius: 4,
      color: Color.fromRGBO(0, 0, 0, 0.5),
      offset: Offset(2, 2),
    )
  ],
);
