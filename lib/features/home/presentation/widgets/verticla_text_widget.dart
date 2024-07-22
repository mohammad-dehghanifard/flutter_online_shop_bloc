import 'package:flutter/material.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_dimens.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_strings.dart';
import 'package:flutter_online_shop_bloc/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerticalTextWidget extends StatelessWidget {
  const VerticalTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         RotatedBox(
          quarterTurns: -1,
            child: Text(AppStrings.amazing,style: Theme.of(context).textTheme.titleLarge)),
        const SizedBox(width: AppDimens.medium),
        // view all
        Column(
          children: [
             RotatedBox(
              quarterTurns: -1,
                child: Text(AppStrings.viewAll,style: Theme.of(context).textTheme.titleSmall,)),
            const SizedBox(height: AppDimens.medium),
            SvgPicture.asset(Assets.svg.leftArrow)
          ],
        )
      ],
    );
  }
}
