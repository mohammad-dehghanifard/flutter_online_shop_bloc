import 'package:flutter/material.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_colors.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_dimens.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_strings.dart';
import 'package:flutter_online_shop_bloc/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartAddressBox extends StatelessWidget {
  const CartAddressBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 85,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
              color: AppColors.black.withOpacity(0.10),
              blurRadius: 15,
              offset: const Offset(0,3)
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal : AppDimens.pageMargin,vertical: AppDimens.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.sendToAddress,style: Theme.of(context).textTheme.titleMedium!.apply(color: AppColors.greyColor),),
            const SizedBox(height: AppDimens.small),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: Text(
                  AppStrings.lorem,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall,)),
                const SizedBox(width: AppDimens.small),
                SvgPicture.asset(Assets.svg.leftArrow)
              ],
            )
          ],
        ),
      ),
    );
  }
}