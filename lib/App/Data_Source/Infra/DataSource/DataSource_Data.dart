import 'package:testes_de_estudos/App/src/Auth/Domain/Entities/UserEntitie.dart';
import 'package:testes_de_estudos/App/Controller/AppController.dart';

import '../../Domain/Data_Source_UserCase.dart';

import '../../Domain/Entities/Post.dart';

abstract class DataSourceData {
  Future<Map<String, UserData>> incializeListUserData(AppController app);
  Future<Map<String, Post>> incializePostList(AppController app);
  void listenPosts(AppController app);
  void listenUseDatas(AppController app);
  Future<void> uploadPost(Post newPost);

  Future<String> uploadImage(UploadImageForm image);
}
