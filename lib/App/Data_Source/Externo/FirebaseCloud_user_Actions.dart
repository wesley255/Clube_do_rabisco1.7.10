import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:testes_de_estudos/App/Data_Source/Domain/Entities/Comentario_Entitie.dart';
import 'package:testes_de_estudos/App/Data_Source/Infra/DataSource/User_Action_contract.dart';
import 'package:testes_de_estudos/App/LocalServices/Create_ID.dart';

import 'package:testes_de_estudos/Pages/Comentarios/Comentarios_Page.dart';

class FirebaseUserActions implements UserDatasouceActionContract {
  @override
  Future<void> darlike(String postId, String userEmail) async {
    await FirebaseFirestore.instance.collection('Posts').doc(postId).update({
      'favoritos': FieldValue.arrayUnion([userEmail])
    });
  }

  @override
  Future<void> tirarlike(String postId, String userEmail) async {
    FirebaseFirestore.instance.collection('Posts').doc(postId).update({
      'favoritos': FieldValue.arrayRemove([userEmail])
    });
  }

  @override
  Future<void> comentar({required ComentariosForm comentariosForm}) async {
    await FirebaseFirestore.instance
        .collection('Posts')
        .doc(comentariosForm.postId)
        .collection('listaDeComentarios')
        .doc(criateID())
        .set({
      'color': comentariosForm.color.value.toString(),
      'user': comentariosForm.userEmail,
      'data': DateTime.now(),
      'comentario': comentariosForm.comentario,
    });
    await FirebaseFirestore.instance
        .collection('Posts')
        .doc(comentariosForm.postId)
        .update({
      'comentarios':
          AppInstaces.comentarioPageController.mapListComentarios.length
    });
  }

  @override
  Future<void> inicializeListComentarios(String postId) async {
    obseverListComentarios(postId);
    Map<String, ComentariosForm> _value = {};

    await FirebaseFirestore.instance
        .collection('Posts')
        .doc(postId)
        .collection('listaDeComentarios')
        .get()
        .then((QuerySnapshot snapshot) {
      for (var doc in snapshot.docs) {
        _value[doc.id] = ComentariosForm(
          color: Color(int.parse(doc['color'].toString())),
          data: (doc['data'] as Timestamp).toDate(),
          comentario: doc['comentario'],
          userEmail: doc['user'],
          postId: postId,
        );
      }
    });
    AppInstaces.comentarioPageController.mapListComentarios.addAll(_value);
  }

  @override
  Future<void> obseverListComentarios(String postId) async {
    FirebaseFirestore.instance
        .collection('Posts')
        .doc(postId)
        .collection('listaDeComentarios')
        .snapshots()
        .listen((event) {
      if (event.docs.isNotEmpty) {
        var doc = event.docChanges.last.doc;
        if (event.docs.length <
            AppInstaces.comentarioPageController.mapListComentarios.length) {
          //
          AppInstaces.comentarioPageController.mapListComentarios
              .remove(doc.id);
          //
        } else {
          AppInstaces.comentarioPageController.mapListComentarios[doc.id] =
              ComentariosForm(
            color: Color(int.parse(doc['color'])),
            data: (doc['data'] as Timestamp).toDate(),
            comentario: doc['comentario'],
            userEmail: doc['user'],
            postId: postId,
          );
        }
      }
    });
  }
}
