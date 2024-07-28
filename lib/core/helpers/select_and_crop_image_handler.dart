import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class SelectAndCropImageHandler {
  File? _image;
  get getImage => _image;

  Future<void> selectAndCropImage({required ImageSource source}) async {
    try {
      final selectImage = await ImagePicker().pickImage(source: source);
      if(selectImage == null) return ;
      File? imageFile = File(selectImage.path);
      imageFile = await _cropImage(image: imageFile);
      _image = imageFile;
    } catch(e){
      debugPrint(e.toString());
    }
  }


  Future<File?> _cropImage({required File image}) async {
    final CroppedFile? croppedFile = await ImageCropper().cropImage(sourcePath: image.path);
    if(croppedFile == null) return null;
    return File(croppedFile.path);
  }

}

