import 'package:flutter/cupertino.dart';

class RegisterRequest {
  dynamic image;
  final TextEditingController fullNameTxt = TextEditingController();
  final TextEditingController phoneTxt = TextEditingController();
  final TextEditingController addressTxt = TextEditingController();
  final TextEditingController postalCodeTxt = TextEditingController();
  double? lat;
  double? lng;
}