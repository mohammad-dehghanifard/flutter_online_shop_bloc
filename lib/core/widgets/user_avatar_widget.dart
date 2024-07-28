import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_online_shop_bloc/gen/assets.gen.dart';

class UserAvatarWidget extends StatelessWidget {
  const UserAvatarWidget({
    super.key,
    required this.onTap,
    this.imageFile,
  });

  final VoidCallback onTap;
  final File? imageFile;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(1000),
          child: imageFile == null
              ? Image.asset(
              width: size.width * 0.3,
              height: size.width * 0.3,
              fit: BoxFit.cover,
              Assets.png.avatar.path)
              : Image.file(
              width: size.width * 0.3,
              height: size.width * 0.3,
              fit: BoxFit.cover,
              File(
                imageFile!.path,
              ))),
    );
  }
}
