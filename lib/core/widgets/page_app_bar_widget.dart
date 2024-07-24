import 'package:flutter/material.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_colors.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_dimens.dart';

class PageAppBarWidget extends StatelessWidget implements PreferredSize{
  const PageAppBarWidget({super.key, this.leading, this.title, this.action,this.centerTitle = false});
  final Widget? leading,title,action;
  final bool centerTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(AppDimens.large),
          bottomRight: Radius.circular(AppDimens.large),
        ),
        color: AppColors.mainBg,
        boxShadow: [
          BoxShadow(color: AppColors.black.withOpacity(0.20),blurRadius: 15)
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.medium),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                if(leading != null)
                leading!,

                if(title != null)
                 centerTitle? Center(child: title!) : title!,

                if(action != null)
                  action!,
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget get child => this;

  @override
  Size get preferredSize => const Size(double.infinity, 80);
}
