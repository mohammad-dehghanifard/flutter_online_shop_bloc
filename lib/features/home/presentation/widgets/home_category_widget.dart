import 'package:flutter/material.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_dimens.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeCategoryWidget extends StatelessWidget {
  const HomeCategoryWidget({super.key, required this.onTap, required this.iconPath, required this.text, required this.gradiant});
  final VoidCallback onTap;
  final String iconPath,text;
  final List<Color> gradiant;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimens.large - 8),
              gradient: LinearGradient(
                colors: gradiant,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(iconPath),
            ),
          ),
          const SizedBox(height: AppDimens.small),
           Text(text)
        ],
      ),
    );
  }
}
