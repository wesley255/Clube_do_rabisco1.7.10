// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:testes_de_estudos/App/Controller/AppController.dart';
import 'package:testes_de_estudos/App/LocalServices/Entities/ImageDataEntitie.dart';
import 'package:testes_de_estudos/App/LocalServices/Get_Image.dart';
import 'package:testes_de_estudos/App/Services/AppInstances.dart';
import 'package:testes_de_estudos/App/Widgets/Cards/Card_loading.dart';
import 'package:testes_de_estudos/Pages/Perfil/Widgets/Pefil_Editer.dart';
part 'Perfil_Store.g.dart';

class PerfilController {
  static final PerfilController istance = PerfilController._(PerfilStore());
  final PerfilStore controller;
  PerfilController._(this.controller);
}

class PerfilStore = _Perfil_Store with _$PerfilStore;

abstract class _Perfil_Store with Store {
  AppController appController = AppSevices.appController;
  @observable
  LocalImage? newBackgrandeImagePerfil;
  @observable
  LocalImage? newAvataImagePerfil;
  @observable
  TextEditingController newNickNamePerfilController = TextEditingController();
  @observable
  TextEditingController newStoryPerfilController = TextEditingController();
  @observable
  bool IsVisitantePerfilPage = false;
  @action
  Future<void> getNewAvata() async {
    LocalImage? value = await GetImagePiker().getimage();
    if (value != null) {
      newAvataImagePerfil = value;
    }
  }

  Future<void> getNewbackgrandedImage() async {
    LocalImage? value = await GetImagePiker().getimage();
    if (value != null) {
      newBackgrandeImagePerfil = value;
    }
  }

  @action
  void descartNewAvatar() {
    newAvataImagePerfil = null;
  }

  @action
  void descartNewbackgranded() {
    newBackgrandeImagePerfil = null;
  }

  @action
  void changePageToPefil(BuildContext context) {
    descartNewAvatar();
    descartNewbackgranded();
    Navigator.pop(context);
  }

  @action
  void changePageToEditarPerfil(BuildContext context, AppController app) {
    newNickNamePerfilController.text =
        appController.mapListUsers[appController.loggedUser!.email]!.nome;
    newStoryPerfilController.text =
        appController.mapListUsers[appController.loggedUser!.email]!.story;
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => EditarPefil(app: app)));
  }

  Future<void> saveNewUserData(
    BuildContext context, {
    required String newName,
    required String newStory,
    required LocalImage? newAvatar,
    required LocalImage? newback,
  }) async {
    CardLoading card = CardLoading(context: context);
    card.showMyDialog('salvando', true);
    var _saveNameResult =
        await AppSevices.userDocUpdateSevices.saveName(newName);
    _saveNameResult.fold(
      (l) {
        print('Name Result error:${l.message}');
      },
      (r) => null,
    );
    //
    var _saveStoryResult =
        await AppSevices.userDocUpdateSevices.saveStory(newStory);

    _saveStoryResult.fold(
      (l) {
        print('Store Resut error:${l.message}');
      },
      (r) {
        print('Store Resut:$r');
      },
    );

    ///
    if (newAvatar != null) {
      var _saveAvatarRulte =
          await AppSevices.userDocUpdateSevices.saveAvata(newAvatar);
      print('avatar Resut: $_saveAvatarRulte');
    }
    if (newback != null) {
      var _value =
          await AppSevices.userDocUpdateSevices.saveBackgrondImage(newback);
      print('back: $_value');
    }
    card.claseCard();
    Navigator.pop(context);
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
