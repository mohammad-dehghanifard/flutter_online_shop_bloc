import 'package:flutter/material.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_colors.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_dimens.dart';

class ProductTagWidget extends StatelessWidget {
  const ProductTagWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 80,
          height: 25,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimens.large * 2),
              color: AppColors.primaryColor
          ),
          child: Center(child: Text("شیائومی",style: Theme.of(context).textTheme.titleMedium!.apply(color: AppColors.white))),
        ),
      ],
    );
  }
}