import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:testes_de_estudos/App/src/Auth/Domain/Entities/UserEntitie.dart';

import 'dart:io';

import 'package:testes_de_estudos/App/Data_Source/Infra/DataSource/UserDataSoucer.dart';
import 'package:testes_de_estudos/App/Data_Source/error/Data_source_Expition.dart';
import 'package:testes_de_estudos/App/LocalServices/Entities/ImageDataEntitie.dart';
import 'package:testes_de_estudos/App/Services/AppInstances.dart';

class FirebaseCloudUserData implements UserDataSourcer {
  @override
  Future<Exception?> saveAvata(LocalImage newAvatar) async {
    try {
      String url = await SaveImageinNetwork.save(
        image: newAvatar.image,
        nameImage: 'avatar',
        endereco: 'users/${AppSevices.appController.loggedUser!.email!}',
      );

      await FirebaseFirestore.instance
          .collection('Dados dos Usuarios')
          .doc(AppSevices.appController.getMyUser().email)
          .update({'avatar': url});
      return null;
    } on FirebaseException catch (e) {
      return Exception('error: ${e.message}');
    }
  }

  @override
  Future<Exception?> saveBackgrondImage(LocalImage newBackGrandedImage) async {
    try {
      String url = await SaveImageinNetwork.save(
        image: newBackGrandedImage.image,
        nameImage: 'backgrandImage',
        endereco: 'users/${AppSevices.appController.getMyUser().email}',
      );
      await FirebaseFirestore.instance
          .collection('Dados dos Usuarios')
          .doc(AppSevices.appController.getMyUser().email)
          .update({'back': url});
      return null;
    } on FirebaseException catch (e) {
      return Exception(e.message);
    }
  }

  @override
  Future<Either<DataSourceException, String>> saveName(String newName) async {
    bool usuarioJaExite = AppSevices.appController.mapListUsers.values
        .toList()
        .where((element) => element.nome.toUpperCase() == newName.toUpperCase())
        .toList()
        .isNotEmpty;
    if (usuarioJaExite) {
      return left(DataSourceException(message: 'usuario já exite!'));
    } else {
      await FirebaseFirestore.instance
          .collection('Dados dos Usuarios')
          .doc(AppSevices.appController.getMyUser().email)
          .update({'name': newName});
      return right(newName);
    }
  }

  @override
  Future<Either<Exception, String>> saveStory(String newStory) async {
    try {
      await FirebaseFirestore.instance
          .collection('Dados dos Usuarios')
          .doc(AppSevices.appController.getMyUser().email)
          .update({'story': newStory});
      return right(newStory);
    } on FirebaseException catch (e) {
      return left(e);
    }
  }

  @override
  Future saveNewUserData(CadastroFormEntity cadastroForm) async {
    await FirebaseFirestore.instance
        .collection('Dados dos Usuarios')
        .doc(cadastroForm.email)
        .set({
      'email': cadastroForm.email,
      'name': cadastroForm.nickName,
      'username': cadastroForm.username,
      'avatar': '',
      'back': '',
      'story': '',
    });
  }
}

class SaveImageinNetwork {
  static Future<String> save({
    required File image,
    required String nameImage,
    required String endereco,
  }) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    //
    Reference ref = storage.ref().child(endereco).child(nameImage);
    //
    UploadTask uploadTask = ref.putFile(image);
    //
    var url = await (await uploadTask.whenComplete(() {})).ref.getDownloadURL();
    return url.toString();
  }
}
