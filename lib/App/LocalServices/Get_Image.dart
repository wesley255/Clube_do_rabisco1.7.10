import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:testes_de_estudos/App/LocalServices/Entities/ImageDataEntitie.dart';

abstract class GetImage {
  Future<LocalImage?> getimage();
}

class GetImagePiker implements GetImage {
  @override
  Future<LocalImage?> getimage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      var imageData = await decodeImageFromList(await image.readAsBytes());
      return LocalImage(
        image: File(image.path),
        heigth: imageData.height.toString(),
        width: imageData.width.toString(),
      );
    } else {
      return null;
    }
  }
}
