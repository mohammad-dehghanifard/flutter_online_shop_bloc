import 'package:flutter/material.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_colors.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_dimens.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_strings.dart';
import 'package:flutter_online_shop_bloc/core/widgets/page_app_bar_widget.dart';
import 'package:flutter_online_shop_bloc/features/home/presentation/widgets/home_product_widget.dart';
import 'package:flutter_online_shop_bloc/features/product/presentation/widgets/product_tag_widget.dart';
import 'package:flutter_online_shop_bloc/gen/assets.gen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageAppBarWidget(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(Assets.svg.close)),
        title:  Text(AppStrings.productsList,style: Theme.of(context).textTheme.titleMedium),
        action: SvgPicture.asset(Assets.svg.cart,colorFilter: const ColorFilter.mode(AppColors.black, BlendMode.srcIn)),
      ),
      body: Column(
        children: [
          const SizedBox(height: AppDimens.large),
          SizedBox(
            height: 45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.only(
                      right: index == 0 ? AppDimens.pageMargin : 0,
                      left: AppDimens.small
                    ),
                    child: const ProductTagWidget(),
                  );
                },
            ),
          ),
          Expanded(
              child: GridView.builder(
                itemCount: 20,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 280
                  ),
                  itemBuilder: (context, index) => const HomeProductWidget(),
              ))
        ],
      ),
    );
  }
}


