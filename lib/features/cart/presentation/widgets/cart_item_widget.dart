import 'package:flutter/material.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_dimens.dart';
import 'package:flutter_online_shop_bloc/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_colors.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal : AppDimens.pageMargin,vertical: AppDimens.small),
      width: double.infinity,
      height: 150,
      decoration:  BoxDecoration(
          color: AppColors.mainContainerBgColor,
          borderRadius: BorderRadius.circular(AppDimens.medium + 4)
      ),
      child: Row(
        children: [
          Image.asset(Assets.png.unnamed.path),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // product name
                  Text(
                    "ساعت شیائومی mi Watch lite",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14,fontWeight: FontWeight.bold),),
                  const SizedBox(height: AppDimens.small - 4),
                  // product price
                  Text(
                    "قیمت  : 40000 تومان",
                    style: Theme.of(context).textTheme.bodyMedium!.apply(color: AppColors.greyColor),),
                  const SizedBox(height: AppDimens.small - 4),
                  // off price
                  Text(
                    "با تخفیف: 500000  تومان",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 14,fontWeight: FontWeight.bold,color: AppColors.primaryColor),),
                  const SizedBox(height: AppDimens.small - 4),
                  // divider
                  Container(
                    width: 180,
                    height: 2,
                    color: AppColors.dividerColor,
                  ),
                  const SizedBox(height: AppDimens.medium),
                  // add and remove item in cart
                  Row(
                    children: [
                      SvgPicture.asset(Assets.svg.plus),
                      const SizedBox(width: AppDimens.small),
                      const Text("1 عدد"),
                      const SizedBox(width: AppDimens.small),
                      SvgPicture.asset(Assets.svg.minus),
                      const Spacer(),
                      SvgPicture.asset(Assets.svg.delete),
                      const SizedBox(width: AppDimens.small),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}