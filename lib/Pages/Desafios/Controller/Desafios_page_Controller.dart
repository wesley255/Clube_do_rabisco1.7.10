import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import 'package:testes_de_estudos/App/LocalServices/Fixed_Format.dart';

import 'package:testes_de_estudos/Pages/Desafios/View/Add_Desafio_Page.dart';

import '../../../App/LocalServices/Entities/ImageDataEntitie.dart';
import '../../../App/SRC/Desadios/Domain/Entitys/Desafio_Entity.dart';

part 'Desafios_page_Controller.g.dart';

class DesafioPageControllerMobx = _DesafilPageControllerIMLP
    with _$DesafioPageControllerMobx;

abstract class _DesafilPageControllerIMLP with Store {
  /*--[variaves]--*/
  ObservableMap<String, DesafioEntity> mapLisDesafios = ObservableMap();
  @observable
  TextEditingController tituloController = TextEditingController();
  @observable
  TextEditingController tagController = TextEditingController();
  @observable
  TextEditingController regrasController = TextEditingController();
  @observable
  File? desafioImageSelect;

  @observable
  int dias = 2;

  int _numeroDeLinha = 0;

  List<String> _listRegrasDoDesafio = [];

  bool travaSicronia = false;
  /*--[actions]--*/
  @action
  void addDayDesafio() {
    if (dias < 7) {
      dias++;
    }
  }

  @action
  void remuveDayDesafio() {
    if (dias > 2) {
      dias--;
    }
  }

  @action
  Future<void> saveNewDesafio() async {}
  @action
  Future<void> getListDesafios() async {}

  void regrasConfig({required String text}) {
    regrasController = FixedFormat.multeLineTexControllerPrefix(
      prefixo: '* ',
      controller: regrasController,
      lines: _numeroDeLinha,
    );
    _listRegrasDoDesafio.addAll(regrasController.text.split('\n'));
    _numeroDeLinha = regrasController.text.split('\n').length;
  }

  @action
  void tagConfig() {
    tagController = FixedFormat.prefixoTextController(
      controller: tagController,
      prefixo: '# ',
    );
  }

  @action
  Future<void> getimageDesafiol() async {
    LocalImage? value = await GetImagePikercorte.getimage();
    if (value != null) {
      desafioImageSelect = value.image;
    }
  }
}

class DesafioPageController {
  static DesafioPageControllerMobx controller = DesafioPageControllerMobx();
  const DesafioPageController._();
}
