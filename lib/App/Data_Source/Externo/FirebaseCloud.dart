import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:testes_de_estudos/App/Auth/Domain/Entities/UserEntitie.dart';
import 'package:testes_de_estudos/App/Controller/AppController.dart';

import 'package:testes_de_estudos/App/Data_Source/Infra/DataSource/DataSource_Data.dart';

import '../Domain/Data_Source_UserCase.dart';
import '../Domain/Entities/Post.dart';

class FirebaseCloud implements DataSourceData {
  final Map<String, Post> _listPost = {};
  final Map<String, UserData> _listUserDatas = {};
  @override
  incializePostList(AppController app) async {
    listenPosts(app);
    await FirebaseFirestore.instance
        .collection('Posts')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        List _a = (doc.get('Listimage'));

        _listPost[doc.id.toString()] = Post(
          id: doc.id.toString(),
          data: (doc['data'] as Timestamp).toDate(),
          favorios: (doc.get('favoritos')),
          image: (doc.get('Listimage')),
          label: doc['label'],
          nComentarios: doc['comentarios'] as int,
          user: doc['user'],
        );
      }
    });
    return _listPost;
  }

  @override
  void listenPosts(AppController app) {
    FirebaseFirestore.instance.collection('Posts').snapshots().listen((event) {
      var doc = event.docChanges.last.doc;
      if (event.docs.length < app.mapListPosts.length) {
        app.mapListPosts.remove(doc.id);
      } else {
        app.mapListPosts[doc.id] = Post(
          id: doc.id,
          user: doc.get('user'),
          label: doc.get('label'),
          data: (doc['data'] as Timestamp).toDate(),
          image: doc['Listimage'],
          favorios: doc['favoritos'],
          nComentarios: doc.get('comentarios'),
        );
      }
    });
  }

  @override
  incializeListUserData(AppController app) async {
    listenUseDatas(app);
    await FirebaseFirestore.instance
        .collection('Dados dos Usuarios')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        _listUserDatas[doc.id] = UserData(
            username: doc['username'],
            avatar: doc['avatar'],
            backperfil: doc['back'],
            email: doc.id,
            nome: doc['name'],
            story: doc['story']);
      }
    });

    return _listUserDatas;
  }

  @override
  void listenUseDatas(AppController app) {
    FirebaseFirestore.instance
        .collection('Dados dos Usuarios')
        .snapshots()
        .listen(
      (event) {
        var doc = event.docChanges.last.doc;
        if (event.docs.length < app.mapListUsers.length) {
          //
          app.mapListUsers.remove(doc.id);
          //
        } else {
          app.mapListUsers[doc.id] = UserData(
              username: doc['username'],
              avatar: doc['avatar'],
              backperfil: doc['back'],
              email: doc.id,
              nome: doc['name'],
              story: doc['story']);
        }
      },
    );
  }

  /*-------------------------------[comentarios]--------------------------------*/

/*-------------------------------[comentarios]--------------------------------*/
  @override
  Future<void> uploadPost(Post newPost) async {
    await FirebaseFirestore.instance.collection('Posts').doc(newPost.id).set({
      'data': newPost.data,
      'Listimage': newPost.image,
      'user': newPost.user,
      'favoritos': [],
      'comentarios': (0).toInt(),
      'label': newPost.label
    });
  }

  @override
  Future<String> uploadImage(UploadImageForm imageform) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref =
        storage.ref().child(imageform.endereco).child(imageform.imageName);
    UploadTask uploadTask = ref.putFile(imageform.localImage.image);
    var url = await (await uploadTask.whenComplete(() {})).ref.getDownloadURL();
    return url.toString();
  }
}
