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
    this.onTap,
    this.textAlign = TextAlign.center, this.suffixIcon,
    this.redOnly = false,
  });
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final TextAlign textAlign;
  final bool redOnly;
  final Widget? suffixIcon;
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
            readOnly: redOnly,
            controller: controller,
            textAlign: TextAlign.center,
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              filled: true,
              hintText: hint,
              suffixIcon: suffixIcon,
              hintStyle: Theme.of(context).textTheme.bodyMedium!.apply(color: AppColors.greyColor),
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