import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:testes_de_estudos/App/Data_Source/Domain/Entities/Post.dart';
import 'package:testes_de_estudos/App/LocalServices/Fixed_Format.dart';
import 'package:testes_de_estudos/App/LocalServices/Get_Image.dart';
import 'package:testes_de_estudos/App/SRC/Desadios/Externo/Desafio_Firebase.dart';
import 'package:testes_de_estudos/App/Widgets/Cards/Case_Select_imagePost.dart';
import 'package:testes_de_estudos/App/src/Desadios/Data/Repository/Desfio_Repository.dart';
import 'package:testes_de_estudos/App/src/Desadios/Domain/DesafioUsercase.dart';
import 'package:testes_de_estudos/App/src/Desadios/Domain/error/Desfio_Expition.dart';
import 'package:testes_de_estudos/App/Services/AppInstances.dart';
import 'package:testes_de_estudos/App/Widgets/Cards/Card_loading.dart';
import 'package:testes_de_estudos/Pages/Desafios/View/Add_Desafio_Page.dart';
import '../../../App/LocalServices/Entities/ImageDataEntitie.dart';
import '../../../App/src/Desadios/Domain/Entitys/Desafio_Entity.dart';

part 'Desafios_page_Controller.g.dart';

class DesafioPageControllerMobx = _DesafilPageControllerIMLP
    with _$DesafioPageControllerMobx;

abstract class _DesafilPageControllerIMLP with Store {
  final DesafiosUsercaseContracte desfioSevice =
      DesafiosUsercase(DesafioRepositoy(FirebaseDesfio()));
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
  TextEditingController desafioPostTextComtroller = TextEditingController();
  @observable
  bool listDesafioLoading = true;
  @observable
  int dias = 2;
  @observable
  int _numeroDeLinha = 0;
  /*--[variaves]--*/
  List<String> listRegrasDoDesafio = [];
  @computed
  List<DesafioEntity> get desafioAtivo =>
      mapLisDesafios.values.where((element) => element.ativo).toList();
  @computed
  List<DesafioEntity> get desafiosNaoAtivos =>
      mapLisDesafios.values.where((element) => !element.ativo).toList();
  @computed
  List<Post> get getListPostDoDesafio =>
      AppSevices.appController.mapListPosts.values
          .where((element) => element.tags[0] == desafioAtivo[0].tag)
          .toList();
  bool travaSicronia = false;

  /*--[actions]--*/
  @computed
  bool get desafiovalido => DateTime.now().isBefore(desafioAtivo[0].prozo);
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

  Future selectDesafioImagePost(BuildContext context) async {
    LocalImage? valueImage = await GetImagePiker().getimage();
    if (valueImage != null) {
      CardSelectImagePostWidget(
        buttonAction: () async {
          await uploadNewPosts(context, valueImage);
        },
        tag: desafioAtivo[0].tag,
        textController: desafioPostTextComtroller,
        user: AppSevices.appController.getMyUser(),
        context: context,
        imageSoucer: valueImage,
      ).showMyDialog();
    }
  }

  @action
  Future<void> uploadNewPosts(BuildContext context, LocalImage image) async {
    CardLoading cardLoading = CardLoading(context: context);
    cardLoading.showMyDialog('Posttando', false);
    await AppSevices.webdatasorce.uploadPost(
      label: desafioPostTextComtroller.text,
      localImage: image,
      tags: [desafioAtivo[0].tag],
    );
    cardLoading.claseCard();
    cardLoading.claseCard();
    desafioPostTextComtroller.clear();
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @action
  Future<void> saveNewDesafio(BuildContext context) async {
    CardLoading card = CardLoading(context: context);
    DesafioFrom form = DesafioFrom(
      ativo: false,
      image: desafioImageSelect,
      titulo: tituloController.text,
      tag: tagController.text,
      listDeRegras: regrasController.text,
      duration: dias,
      usuario: AppSevices.appController.loggedUser!.email!,
    );
    card.showMyDialog('Salvando..', false);
    var result = await desfioSevice.validarAndSaveDesafio(form);
    card.claseCard();
    result.fold(
      (error) {
        _interfaceErro(error, context);
      },
      (r) {
        _despose();
      },
    );
  }

  @action
  Future<void> getListDesafios() async {
    var resultGetListDesafio = await desfioSevice.getMapListDesfios();
    resultGetListDesafio.fold(
      (error) {
        print('getListDesafio Error!');
        listDesafioLoading = false;
      },
      (listDesafio) {
        mapLisDesafios.addAll(listDesafio);

        listDesafioLoading = false;
      },
    );
  }

  void regrasConfig({required String text}) {
    regrasController = FixedFormat.multeLineTexControllerPrefix(
      prefixo: '* ',
      controller: regrasController,
      lines: _numeroDeLinha,
    );
    listRegrasDoDesafio.addAll(regrasController.text.split('\n'));
    _numeroDeLinha = regrasController.text.split('\n').length;
  }

  @action
  void tagConfig() {
    tagController = FixedFormat.prefixoTextController(
      controller: tagController,
      prefixo: '#',
    );
  }

  @action
  Future<void> getimageDesafiol() async {
    LocalImage? value = await GetImagePikercorte.getimage();
    if (value != null) {
      desafioImageSelect = value.image;
    }
  }

  @action
  _interfaceErro(DesafioExpition error, BuildContext context) {
    CardLoading card = CardLoading(context: context);
    //#Titulo
    if (error.titulo != null) {
      card.showMyDialog(error.titulo!, true);
    }
    //#tag
    if (error.tag != null) {
      card.showMyDialog(error.tag!, true);
    }
    //#duration
    if (error.duration != null) {
      card.showMyDialog(error.duration!, true);
    }
    //#regras
    if (error.listDeRegras != null) {
      card.showMyDialog(error.listDeRegras!, true);
    }
    //#url
    if (error.url != null) {
      card.showMyDialog(error.url!, true);
    }
    //#ativo
    if (error.ativo != null) {
      card.showMyDialog(error.ativo!, true);
    }
    if (error.url != null) {
      card.showMyDialog(error.url!, true);
    }
  }

  Future<void> seletcDesafio({String? tag}) async {
    desfioSevice.sortiarDesafio(listDesafio: mapLisDesafios.values.toList());
  }

  @action
  void _despose() {
    desafioImageSelect = null;
    tituloController.clear();
    tagController.clear();
    regrasController.clear();
    dias = 2;
  }
}

class DesafioPageController {
  static DesafioPageControllerMobx controller = DesafioPageControllerMobx();
  const DesafioPageController._();
}
