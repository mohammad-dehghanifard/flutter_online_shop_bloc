import 'package:flutter/material.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_strings.dart';

class RegisterPageAppBarWidget extends StatelessWidget implements PreferredSize{
  const RegisterPageAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text(AppStrings.register),
    );
  }

  @override
  Widget get child => this;

  @override
  Size get preferredSize => const Size(double.infinity, 45);
}