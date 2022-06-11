import 'package:testes_de_estudos/App/src/Auth/Domain/Entities/UserEntitie.dart';
import 'package:testes_de_estudos/App/Controller/AppController.dart';

import 'package:testes_de_estudos/App/Data_Source/Infra/DataSource/DataSource_Data.dart';

import '../../Domain/Data_Source_UserCase.dart';

import '../../Domain/Entities/Post.dart';

abstract class DataSourceRepositoriy {
  Future<Map<String, Post>> incializePostList(AppController app);
  Future<Map<String, UserData>> incializeListUserData(AppController app);
  Future<void> uploadPost(Post newPost);

  Future<String> uploadImage(UploadImageForm image);
}

class DataSourceRepositoriyIMPL implements DataSourceRepositoriy {
  final DataSourceData sourceData;

  DataSourceRepositoriyIMPL(this.sourceData);

  @override
  Future<Map<String, Post>> incializePostList(AppController app) async {
    return await sourceData.incializePostList(app);
  }

  @override
  Future<Map<String, UserData>> incializeListUserData(AppController app) async {
    return await sourceData.incializeListUserData(app);
  }

  @override
  Future<void> uploadPost(Post newPost) async {
    return await sourceData.uploadPost(newPost);
  }

  @override
  Future<String> uploadImage(UploadImageForm image) async {
    return await sourceData.uploadImage(image);
  }
}
