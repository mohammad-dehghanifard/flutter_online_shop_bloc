import 'package:flutter/material.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_colors.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_dimens.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_strings.dart';
import 'package:flutter_online_shop_bloc/core/widgets/custom_button_widget.dart';
import 'package:flutter_online_shop_bloc/core/widgets/page_app_bar_widget.dart';
import 'package:flutter_online_shop_bloc/features/cart/presentation/widgets/cart_address_box.dart';
import 'package:flutter_online_shop_bloc/features/cart/presentation/widgets/cart_item_widget.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PageAppBarWidget(
        title: Padding(
          padding: const EdgeInsets.only(right: AppDimens.medium),
          child: Text(AppStrings.basket,style: Theme.of(context).textTheme.titleMedium),
        )
        ,alignment: MainAxisAlignment.start,),
      body:  Column(
        children: [
          const SizedBox(height: AppDimens.large),
          // address card
          const CartAddressBox(),
          const SizedBox(height: AppDimens.large),
          // card list
          Expanded(
              child: ListView.builder(
                itemCount: 10,
                  itemBuilder: (context, index) {
                    return const CartItemWidget();
                  },
              )
          ),
          // send order and final price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButtonWidget(
                height: 36,
                  width: 45,
                  bgColor: AppColors.redColor,
                  onTap: () {},
                  text: AppStrings.nextBuyProduct),
              Text("مجموع  63,500 تومان",style: Theme.of(context).textTheme.titleMedium,)
            ],
          )
        ],
      ),
    );
  }
}




