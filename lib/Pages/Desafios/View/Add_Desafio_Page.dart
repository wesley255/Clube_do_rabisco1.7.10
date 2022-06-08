import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_cropper/image_cropper.dart';

import 'package:testes_de_estudos/App/Styles/App_Styles.dart';
import 'package:testes_de_estudos/App/Widgets/ButtonGetImage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testes_de_estudos/Pages/Desafios/Controller/Desafios_page_Controller.dart';
import '../../../App/LocalServices/Entities/ImageDataEntitie.dart';

class AddDesafioPage extends StatefulWidget {
  const AddDesafioPage({Key? key}) : super(key: key);
  @override
  State<AddDesafioPage> createState() => _AddDesafioPageState();
}

class _AddDesafioPageState extends State<AddDesafioPage> {
  final DesafioPageControllerMobx _pageController =
      DesafioPageController.controller;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            reverse: true,
            child: Observer(builder: (context) {
              return Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: AspectRatio(
                            aspectRatio: 394 / 178,
                            child: InteractiveViewer(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.brown,
                                  image:
                                      _pageController.desafioImageSelect == null
                                          ? null
                                          : DecorationImage(
                                              image: FileImage(_pageController
                                                  .desafioImageSelect!),
                                              fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 20,
                        child: ButtonGetImage(
                          radius: 25,
                          onTap: () async {
                            _pageController.getimageDesafiol();
                          },
                        ),
                      )
                    ],
                  ),
                  BoxParmEditar(
                    titulo: 'titulo',
                    controller: _pageController.tituloController,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    '*Titulo com mais de 10 caracteres devem se tornar responsivos*',
                    style: TextStyle(
                      fontFamily: AppFontes.montserrat,
                      fontSize: 12,
                    ),
                  ),
                  BoxParmEditar(
                    titulo: '#tag de vinculo',
                    controller: _pageController.tagController,
                    textAlign: TextAlign.center,
                    margim: EdgeInsets.symmetric(vertical: 10),
                    onChanged: (t) {
                      _pageController.tagConfig();
                    },
                  ),
                  BoxParmEditar(
                    titulo: 'regras do desafio',
                    controller: _pageController.regrasController,
                    muiltline: 10,
                    onChanged: (t) {
                      _pageController.regrasConfig(text: t);
                    },
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

class GetImagePikercorte {
  GetImagePikercorte._();
  static Future<LocalImage?> getimage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      var imageData = await decodeImageFromList(await image.readAsBytes());
      File? croppedFile = await ImageCropper().cropImage(
        sourcePath: image.path,
        aspectRatio: CropAspectRatio(ratioX: 394, ratioY: 178),
      );
      if (croppedFile != null) {
        return LocalImage(
          image: File(croppedFile.path),
          heigth: imageData.height.toString(),
          width: imageData.width.toString(),
        );
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}

class BoxParmEditar extends StatelessWidget {
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final void Function()? onEditingComplete;
  final int? maxTextLeanth;
  final TextAlign? textAlign;
  final int? muiltline;
  final double? heigth;
  final String titulo;
  final TextEditingController? controller;
  final EdgeInsets? margim;
  const BoxParmEditar(
      {required this.titulo,
      this.onEditingComplete,
      this.onSubmitted,
      this.onChanged,
      this.maxTextLeanth,
      this.controller,
      this.margim,
      this.heigth,
      this.textAlign,
      this.muiltline});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: margim,
      height: heigth,
      width: double.infinity,
      color: Color(0xff010C10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: TextStyle(),
          ),
          TextField(
            onEditingComplete: onEditingComplete,
            onSubmitted: onSubmitted,
            textInputAction: TextInputAction.newline,
            maxLines: null,
            onChanged: onChanged,
            maxLength: maxTextLeanth,
            controller: controller,
            textAlign: textAlign == null ? TextAlign.start : textAlign!,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          )
        ],
      ),
    );
  }
}

List<String> regras = [];
String test = '';
