import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_colors.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_dimens.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_strings.dart';
import 'package:flutter_online_shop_bloc/core/widgets/custom_text_field_widget.dart';
import 'package:flutter_online_shop_bloc/features/home/presentation/widgets/home_slider_widget.dart';
import 'package:flutter_online_shop_bloc/gen/assets.gen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // search bar
              Container(
                margin: const EdgeInsets.all(AppDimens.pageMargin),
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: AppColors.black.withOpacity(0.10),blurRadius: 20,offset: const Offset(0,3))
                  ]
                ),
                child:  CustomTextField(
                  hasBorder: false,
                  radius: AppDimens.large * 5,
                  width: double.infinity,
                  hint: AppStrings.searchProduct,
                  suffixIcon: const Icon(CupertinoIcons.search),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(AppDimens.medium),
                    child: Image.asset(Assets.png.mainLogo.path,height: 32,),
                  ),

                ),
              ),
              HomeSliderWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
