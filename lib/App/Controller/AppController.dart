import 'package:mobx/mobx.dart';

import 'package:testes_de_estudos/App/Data_Source/Domain/Entities/Post.dart';
import 'package:testes_de_estudos/App/Services/AppInstances.dart';
import 'package:testes_de_estudos/App/src/Auth/Domain/Entities/UserEntitie.dart';
import 'package:testes_de_estudos/Pages/Desafios/Controller/Desafios_page_Controller.dart';

import '../Data_Source/Domain/Entities/Comentario_Entitie.dart';

part 'AppController.g.dart';

class AppController = _AppController with _$AppController;

abstract class _AppController with Store {
  //
  /*---------------------\/-[ListDataMaps]-\/----------------------*/
  //
  ObservableMap<String, Post> mapListPosts = ObservableMap.of({});
  ObservableMap<String, UserData> mapListUsers = ObservableMap.of({});
  ObservableMap<String, ComentariosForm> mapListComentarios =
      ObservableMap.of({});
  @computed
  List<Post> get getMyPost => mapListPosts.values.where((post) {
        return post.user == loggedUser!.email;
      }).toList();
  @computed
  List<Post> get getMyFavoritoPost => mapListPosts.values.where((post) {
        return post.favorios.contains(loggedUser!.email);
      }).toList();

  List<Post> getVisitanteListPosts(String visitantEmail) =>
      mapListPosts.values.where((post) {
        return post.user == visitantEmail;
      }).toList();

  List<Post> getVisitanteListPostsFavoritos(String visitantEmail) =>
      mapListPosts.values.where((post) {
        return post.favorios.contains(visitantEmail);
      }).toList();
  //
  /*---------------------/\-[ListDataMaps]-/\----------------------*/
  //
  /*---------------------\/-[Instâncias]-\/----------------------*/
  //
  // final authSevices = AppSevices.auth;
  final dataSource = AppSevices.webdatasorce;
  //
  /*---------------------/\-[Instâncias]-/\----------------------*/
  @action
  Future<void> inicialiceLists() async {
    Map<String, UserData> _soucerUser =
        await dataSource.incializeListUserData(AppSevices.appController);
    Map<String, Post>? _soucerPost = await dataSource.inicializeListPost(
      AppSevices.appController,
    );
    await DesafioPageController.controller.getListDesafios();
    mapListPosts.addAll(_soucerPost);
    mapListUsers.addAll(_soucerUser);
  }
  /*---------------------/\-[]-/\----------------------*/

  @observable
  LoggedUserEntity? loggedUser;
  @observable
  bool appLoading = true;
  @action
  setLoggeduser(LoggedUserEntity? user) {
    loggedUser = user;
  }

  @action
  singout() {
    AppSevices.auth.singout.singout();
    loggedUser = null;
    //mapListComentarios.clear();
    // mapListUsers.clear();
    // mapListPosts.clear();
  }

  UserData getMyUser() {
    return mapListUsers[loggedUser!.email]!;
  }

  List<Post> getPostList() {
    return mapListPosts.values.toList();
  }

  @action
  Future<void> inicializeApp() async {
    await inicialiceLists();
    loggedUser = AppSevices.auth.check.getLoggedUser();
    appLoading = false;
  }
}
