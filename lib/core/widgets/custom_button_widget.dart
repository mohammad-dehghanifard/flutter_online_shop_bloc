import 'package:flutter/material.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_colors.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_dimens.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key, required this.onTap, required this.text, this.width = 200, this.height = 45,
  });

  final VoidCallback onTap;
  final String text;
  final double width,height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll(AppColors.primaryColor),
            shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDimens.medium))),
            minimumSize:  WidgetStatePropertyAll(Size(width,height))
        ),
        child: Text(text,style: Theme.of(context).textTheme.bodyMedium!.apply(color: AppColors.mainBg),));
  }
}