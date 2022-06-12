import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:testes_de_estudos/App/Controller/AppController.dart';
import 'package:testes_de_estudos/App/Data_Source/Domain/Data_Source_UserCase.dart';
import 'package:testes_de_estudos/App/LocalServices/Entities/ImageDataEntitie.dart';
import 'package:testes_de_estudos/App/LocalServices/Get_Image.dart';
import 'package:testes_de_estudos/App/Services/AppInstances.dart';
import 'package:testes_de_estudos/App/Widgets/Cards/Card_loading.dart';
import 'package:testes_de_estudos/App/Widgets/Cards/Case_Select_imagePost.dart';

part 'HomeStore.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  /*---------------------[instances]---------------------*/
  DataSourceUsercaseUserCase dataSource = AppSevices.webdatasorce;
  final AppController _app = AppSevices.appController;
  final GetImage _getImage = GetImagePiker();
  /*---------------------[instances]---------------------*/
  @observable
  LocalImage? localImageHomePost;
  @observable
  TextEditingController homeTextController = TextEditingController();

  @action
  Future selectHomeImagePost(BuildContext context) async {
    localImageHomePost = await _getImage.getimage();
    if (localImageHomePost != null) {
      CardSelectImagePostWidget(
        buttonAction: () => uploadNewPosts(context),
        textController: homeTextController,
        user: _app.getMyUser(),
        context: context,
        imageSoucer: localImageHomePost!,
      ).showMyDialog();
    }
  }

  @action
  Future<void> uploadNewPosts(BuildContext context) async {
    CardLoading cardLoading = CardLoading(context: context);
    cardLoading.showMyDialog('Posttando', false);
    await _app.dataSource.uploadPost(
      tags: ['#'],
      label: homeTextController.text,
      localImage: localImageHomePost,
    );
    cardLoading.claseCard();
    cardLoading.claseCard();
    localImageHomePost = null;
    homeTextController.clear();
    FocusScope.of(context).requestFocus(FocusNode());
  }
}

class HomeController extends HomeStore {
  static final HomeController instance = HomeController._(HomeStore());
  final HomeStore controller;
  HomeController._(this.controller);
}
