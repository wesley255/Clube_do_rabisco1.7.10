import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:testes_de_estudos/App/Controller/AppController.dart';
import 'package:testes_de_estudos/App/Widgets/CusttomButtom.dart';
import 'package:testes_de_estudos/App/Widgets/GridView.dart';
import 'package:testes_de_estudos/Pages/Perfil/Controller/Perfil_Store.dart';

class PerfilBoby extends StatelessWidget {
  final String? visitanteEmail;

  final PerfilStore perfilController;
  final AppController app;
  const PerfilBoby(
      {this.visitanteEmail, required this.perfilController, required this.app});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Observer(builder: (context) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Color(0xff010C10),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(5),
                    height: 100,
                    child: Text(visitanteEmail == null
                        ? app.mapListUsers[app.loggedUser!.email]!.story
                        : app.mapListUsers[visitanteEmail]!.story),
                  );
                }),
              ),
              visitanteEmail == null
                  ? Column(
                      children: [
                        CusttonButton(
                          width: 100,
                          labal: 'Editar',
                          ontap: () {
                            perfilController.changePageToEditarPerfil(
                                context, app);
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CusttonButton(
                          width: 100,
                          borderColor: Colors.red,
                          labal: 'Sair',
                          ontap: () {
                            app.singout();
                          },
                        ),
                      ],
                    )
                  : SizedBox()
            ],
          ),
          GaleriaGrid(
            buttonText: 'Galeria',
            context: context,
            posts: visitanteEmail != null
                ? app.getVisitanteListPosts(visitanteEmail!)
                : app.getMyPost,
          ),
          SizedBox(
            height: 10,
          ),
          GaleriaGrid(
            buttonText: 'Favoritos',
            context: context,
            posts: visitanteEmail != null
                ? app.getVisitanteListPostsFavoritos(visitanteEmail!)
                : app.getMyFavoritoPost,
          ),
        ],
      ),
    );
  }
}
