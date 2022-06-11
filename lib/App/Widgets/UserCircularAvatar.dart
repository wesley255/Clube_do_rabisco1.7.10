import 'dart:io';

import 'package:flutter/material.dart';
import 'package:testes_de_estudos/App/src/Auth/Domain/Entities/UserEntitie.dart';
import 'package:testes_de_estudos/App/Services/AppInstances.dart';
import 'package:testes_de_estudos/Pages/Perfil/Perfil_page.dart';

class UserCircularAvatar extends StatelessWidget {
  final bool? travarClick;
  final EdgeInsetsGeometry? margin;
  final double? size;
  final UserData user;
  final File? fileImage;
  const UserCircularAvatar(
      {this.travarClick,
      this.size,
      required this.user,
      this.fileImage,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: travarClick != null
          ? null
          : () {
              if (user.email == AppSevices.appController.getMyUser().email) {
                print('\n ' 'myuser ${user.email} ' '\n');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PerfilPage(
                      isVisitantPefilPage: false,
                    ),
                  ),
                );
              } else {
                print('\n' 'visitante  ${user.email}' ' \n');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PerfilPage(
                      isVisitantPefilPage: true,
                      visitanteEmail: user.email,
                    ),
                  ),
                );
              }
            },
      child: Container(
        margin: margin,
        height: size ?? 50,
        width: size ?? 50,
        decoration: BoxDecoration(
            color: Color(0xff113043),
            borderRadius: BorderRadius.circular(size ?? 50),
            border: Border.all(color: Color(0xff081720), width: 3),
            image: fileImage == null
                ? user.avatar != ''
                    ? DecorationImage(
                        image: NetworkImage(user.avatar),
                        fit: BoxFit.cover,
                      )
                    : null
                : DecorationImage(
                    image: FileImage(fileImage!),
                    fit: BoxFit.cover,
                  )),
        child: user.avatar == '' && fileImage == null
            ? Center(
                child: Text(
                  user.nome.substring(0, 1),
                  style: TextStyle(
                    fontSize: size == null ? 36 : size! / 100 * 80,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : SizedBox(),
      ),
    );
  }
}
