import 'dart:io';

import 'package:testes_de_estudos/App/Controller/AppController.dart';

import 'package:testes_de_estudos/App/Data_Source/Infra/Repository/DataSourceRepositore.dart';
import 'package:testes_de_estudos/App/LocalServices/Entities/ImageDataEntitie.dart';
import 'package:testes_de_estudos/App/Services/AppInstances.dart';
import 'package:testes_de_estudos/App/src/Auth/Domain/Entities/UserEntitie.dart';

import '../../LocalServices/Create_ID.dart';

import 'Entities/Post.dart';

abstract class DataSourceUsercaseUserCase {
  Future<Map<String, Post>> inicializeListPost(AppController app);
  Future<Map<String, UserData>> incializeListUserData(AppController app);
  Future<void> uploadPost(LocalImage? localImage, String label);

  Future<String> uploadImage(UploadImageForm image);
}

class DataSourceUsercaseUserCaseIMPL implements DataSourceUsercaseUserCase {
  final DataSourceRepositoriy repositoriy;

  DataSourceUsercaseUserCaseIMPL(this.repositoriy);
  @override
  Future<Map<String, Post>> inicializeListPost(AppController app) async {
    return await repositoriy.incializePostList(app);
  }

  @override
  Future<Map<String, UserData>> incializeListUserData(AppController app) async {
    return await repositoriy.incializeListUserData(app);
  }

  @override
  Future<void> uploadPost(LocalImage? localImage, String label) async {
    if (localImage != null) {
      UploadImageForm imageFrom = UploadImageForm(
        endereco: 'posts',
        imageName: 'image' + criateID(),
        image: localImage.image,
      );
      String imageurl = await uploadImage(imageFrom);
      Post newPost = Post(
        id: criateID(),
        user: AppSevices.appController.loggedUser!.email!,
        label: label,
        data: DateTime.now(),
        image: [
          {
            'url': imageurl,
            'width': localImage.width,
            'heigth': localImage.heigth
          }
        ],
        favorios: [],
        nComentarios: 0,
      );
      return await repositoriy.uploadPost(newPost);
    }
  }

  @override
  Future<String> uploadImage(UploadImageForm image) async {
    return await repositoriy.uploadImage(image);
  }
}

class UploadImageForm {
  File image;
  String endereco;
  String imageName;
  UploadImageForm({
    required this.endereco,
    required this.imageName,
    required this.image,
  });
}
