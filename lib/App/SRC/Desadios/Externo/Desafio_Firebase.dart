import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:testes_de_estudos/App/Data_Source/Domain/Data_Source_UserCase.dart';
import 'package:testes_de_estudos/App/Services/AppInstances.dart';
import 'package:testes_de_estudos/App/src/Desadios/Data/Data_souce/Desafio_DataSouce.dart';
import 'package:testes_de_estudos/App/src/Desadios/Domain/Entitys/Desafio_Entity.dart';
import 'package:testes_de_estudos/App/src/Desadios/Domain/error/Desfio_Expition.dart';
import 'package:testes_de_estudos/Pages/Desafios/Controller/Desafios_page_Controller.dart';

class FirebaseDesfio implements DesafioDataSourceContract {
  @override
  getMapListDesfios() async {
    observerDesafioList();
    Map<String, DesafioEntity> value = {};
    var db = FirebaseFirestore.instance.collection('Desafios');
    return db.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        value[doc.id] = DesafioEntity(
          imageUrl: doc['imageUrl'],
          titulo: doc['titulo'],
          tag: doc['tag'],
          regras: doc['regras'],
          duration: doc['duration'],
          prozo: (doc['prozo'] as Timestamp).toDate(),
          ativo: doc['ativo'],
          user: doc['user'],
        );
      }
      return right(value);
    });
  }

  @override
  Future<Either<DesafioExpition, String>> saveDesafio(DesafioFrom from) async {
    var db = FirebaseFirestore.instance.collection('Desafios');
    bool exists = await db
        .doc(from.tag.toUpperCase())
        .get()
        .then((value) => value.exists);

    if (!exists) {
      UploadImageForm image = UploadImageForm(
        endereco: 'Desfios/${from.tag}',
        imageName: 'DesfioImage',
        image: from.image!,
      );
      String? url = await AppSevices.webdatasorce.uploadImage(image);
      await db.doc(from.tag.toUpperCase()).set({
        'imageUrl': url,
        'titulo': from.titulo,
        'tag': from.tag,
        'regras': from.listDeRegras,
        'duration': from.duration,
        'ativo': false,
        'prozo': DateTime.now(),
        'user': from.usuario
      });
      return right(from.tag);
    } else {
      print('tag erro');
      return left(DesafioExpition(tag: 'Tag já esta em uso!'));
    }
  }

  observerDesafioList() {
    var desafioPagaController = DesafioPageController.controller;
    var db = FirebaseFirestore.instance.collection('Desafios');
    db.snapshots().listen((event) {
      var doc = event.docChanges.last.doc;

      if (event.docs.length < desafioPagaController.mapLisDesafios.length) {
        desafioPagaController.mapLisDesafios.remove(doc.id);
      } else {
        desafioPagaController.mapLisDesafios[doc.id] = DesafioEntity(
            imageUrl: doc['imageUrl'],
            titulo: doc['titulo'],
            tag: doc['tag'],
            regras: doc['regras'],
            duration: doc['duration'],
            ativo: doc['ativo'],
            prozo: (doc['prozo'] as Timestamp).toDate(),
            user: doc['user']);
      }
    });
  }
}
