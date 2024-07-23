import 'package:flutter/material.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_colors.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_dimens.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_strings.dart';
import 'package:flutter_online_shop_bloc/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavigationWidget extends StatelessWidget {
  const CustomNavigationWidget({super.key, required this.selectedIndex, required this.onChange});
  final int selectedIndex;
  final Function(int index) onChange;
  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: 60,
      color: AppColors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(onTap: () => onChange(0), title: AppStrings.home, iconPath: Assets.svg.home, selected: selectedIndex == 0),
          _NavItem(onTap: () => onChange(1), title: AppStrings.basket, iconPath: Assets.svg.cart, selected: selectedIndex == 1),
          _NavItem(onTap: () => onChange(2), title: AppStrings.profile, iconPath: Assets.svg.user, selected: selectedIndex == 2),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({super.key, required this.onTap, required this.title, required this.iconPath, required this.selected});
  final VoidCallback onTap;
  final String title,iconPath;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(iconPath,colorFilter: ColorFilter.mode(
              selected ? AppColors.navigationSelected : AppColors.navigationUnSelected,
              BlendMode.srcIn),),
          const SizedBox(height: AppDimens.small - 4),
          Text(title,style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: selected ? AppColors.navigationSelected : AppColors.navigationUnSelected,
              fontSize: 12,
              fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

