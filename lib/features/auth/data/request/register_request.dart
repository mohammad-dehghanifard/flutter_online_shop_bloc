import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class RegisterRequest {
  File? image;
  final TextEditingController fullNameTxt = TextEditingController();
  final TextEditingController phoneTxt = TextEditingController();
  final TextEditingController addressTxt = TextEditingController();
  final TextEditingController postalCodeTxt = TextEditingController();
  double? lat;
  double? lng;

  FormData sendRequest() {
    return  FormData.fromMap({
      "image" : MultipartFile.fromFileSync(image!.path),
      "phone" : phoneTxt.text,
      "name" : fullNameTxt.text,
      "address" : addressTxt.text,
      "postal_code" : postalCodeTxt.text,
      "lat" : lat,
      "lng" : lng
    });
  }
}