import 'package:flutter/material.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_colors.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_dimens.dart';
import 'package:flutter_online_shop_bloc/gen/assets.gen.dart';

class HomeProductWidget extends StatelessWidget {
  const HomeProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 162,
      height: 289,
      margin: const EdgeInsets.all(AppDimens.medium),
      decoration:  BoxDecoration(
          gradient: const LinearGradient(
              colors: AppColors.productBgGradiant,
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter
          ),
          borderRadius: BorderRadius.circular(AppDimens.medium)
      ),
      child: Column(
        children: [
          Image.asset(Assets.png.unnamed.path),
          const SizedBox(height: AppDimens.large),
          // product name
          Text("ساعت مردانه نیوفورس",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),),
          const SizedBox(height: AppDimens.medium),
          // off and price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // off
              Container(
                width: 44,
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimens.medium),
                    color: AppColors.redColor
                ),
                child: Center(child: Text("20%",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.mainBg),)),
              ),
              // price
              const Text("63,500 تومان")
            ],
          ),
          const SizedBox(height: AppDimens.medium),
          // Divider
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimens.medium),
            child: Divider(color: AppColors.primaryColor,),
          ),
          const SizedBox(height: AppDimens.small),
          // timer
          Text("09:26:22",style: Theme.of(context).textTheme.bodyMedium!.apply(color: AppColors.primaryColor),)
        ],
      ),
    );
  }
}