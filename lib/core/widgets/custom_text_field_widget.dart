import 'package:flutter/material.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_colors.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_dimens.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.hint,
    this.headerText,
    this.width = 250.0,
    this.height = 70.0,
  });
  final TextEditingController? controller;
  final String? hint,headerText;
  final double width,height;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(headerText != null)...[
          Text(headerText!),
          const SizedBox(height: AppDimens.small)
        ],

        SizedBox(
          width: width,
          height: height,
          child: TextField(
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              filled: true,
              hintText: hint,
              fillColor: AppColors.mainBg,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDimens.medium),
                  borderSide: const BorderSide(color: AppColors.greyBorderColor)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppDimens.medium),
                  borderSide: const BorderSide(color: AppColors.primaryColor)
              ),
            ),
          ),
        ),
      ],
    );
  }
}