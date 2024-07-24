import 'package:flutter/material.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_colors.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_dimens.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_strings.dart';
import 'package:flutter_online_shop_bloc/core/widgets/page_app_bar_widget.dart';
import 'package:flutter_online_shop_bloc/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageAppBarWidget(
        title: Padding(
          padding: const EdgeInsets.only(right: AppDimens.medium),
          child: Text(AppStrings.userProfile,style: Theme.of(context).textTheme.titleMedium),
        )
        ,alignment: MainAxisAlignment.start,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.pageMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // avatar
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppDimens.large * 4),
                    child: Image.asset(Assets.png.avatar.path)),
              ),
              const SizedBox(height: AppDimens.small),
              Center(child: Text("محمد دهقانی فرد",style: Theme.of(context).textTheme.titleMedium)),
              const SizedBox(height: AppDimens.medium),

              // Active address
              Text(AppStrings.activeAddress,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 14,fontWeight: FontWeight.bold)),
              const SizedBox(height: AppDimens.small),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppStrings.lorem,style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 12,color: AppColors.greyColor)),
                  SvgPicture.asset(Assets.svg.leftArrow)
                ],
              ),
              const SizedBox(height: AppDimens.large),
              // postal code
              Row(
                children: [
                  SvgPicture.asset(Assets.svg.postalCode,colorFilter: const ColorFilter.mode(AppColors.black, BlendMode.srcIn)),
                  const SizedBox(width: AppDimens.small),
                  const Text("112233445566")
                ],
              ),
              const SizedBox(height: AppDimens.medium),
              // phone number
              Row(
                children: [
                  SvgPicture.asset(Assets.svg.phone,colorFilter: const ColorFilter.mode(AppColors.black, BlendMode.srcIn)),
                  const SizedBox(width: AppDimens.small),
                  const Text("09112223344")
                ],
              ),
              const SizedBox(height: AppDimens.medium),
              Row(
                children: [
                  SvgPicture.asset(Assets.svg.user,height: 16,colorFilter: const ColorFilter.mode(AppColors.black, BlendMode.srcIn)),
                  const SizedBox(width: AppDimens.small),
                  const Text("محمد دهقانی فرد")
                ],
              ),
              const SizedBox(height: AppDimens.medium),
              
              // roles
              Container(
                width: double.infinity,
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: AppDimens.medium),
                decoration: BoxDecoration(
                  color: AppColors.mainContainerBgColor,
                  borderRadius: BorderRadius.circular(AppDimens.medium),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    AppStrings.termOfService,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 14,fontWeight: FontWeight.bold),),
                ),
              ),
              const SizedBox(height: AppDimens.large),
              // orders
              Container(
                width: double.infinity,
                height: 120,
                padding: const EdgeInsets.symmetric(horizontal: AppDimens.medium),
                decoration: BoxDecoration(
                  color: AppColors.mainContainerBgColor,
                  borderRadius: BorderRadius.circular(AppDimens.medium),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // in  process
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Assets.svg.inProccess),
                        Text("0",style: Theme.of(context).textTheme.titleMedium),
                        Text(AppStrings.inProcess,style: Theme.of(context).textTheme.bodySmall!.apply(color: AppColors.black))

                      ],
                    ),
                    // canceled
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Assets.svg.cancelled),
                        Text("0",style: Theme.of(context).textTheme.titleMedium),
                        Text(AppStrings.cancelled,style: Theme.of(context).textTheme.bodySmall!.apply(color: AppColors.black))
                      ],
                    ),
                    // delivered
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Assets.svg.delivered),
                        Text("0",style: Theme.of(context).textTheme.titleMedium),
                        Text(AppStrings.delivered,style: Theme.of(context).textTheme.bodySmall!.apply(color: AppColors.black))
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppDimens.large * 1.5),

              Image.asset(Assets.png.adsbanner.path)
            ],
          ),
        ),
      ),
    );
  }
}
