import 'package:flutter/material.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_dimens.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_strings.dart';
import 'package:flutter_online_shop_bloc/core/widgets/custom_button_widget.dart';
import 'package:flutter_online_shop_bloc/core/widgets/custom_text_field_widget.dart';
import 'package:flutter_online_shop_bloc/features/auth/presentation/widgets/register_page_app_bar_widget.dart';
import 'package:flutter_online_shop_bloc/features/home/presentation/pages/home_page.dart';
import 'package:flutter_online_shop_bloc/gen/assets.gen.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const RegisterPageAppBarWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.pageMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // avatar
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppDimens.large * 5),
                    child: Image.asset(Assets.png.avatar.path)),
                // forms
                const CustomTextField(
                  width: double.infinity,
                  headerText: AppStrings.nameLastName,
                  hint: AppStrings.hintNameLastName,
                ),
                const CustomTextField(
                  width: double.infinity,
                  headerText: AppStrings.homeNumber,
                  hint: AppStrings.hintHomeNumber,
                ),
                const CustomTextField(
                  width: double.infinity,
                  headerText: AppStrings.address,
                  hint: AppStrings.hintAddress,
                ),
                const CustomTextField(
                  width: double.infinity,
                  headerText: AppStrings.postalCode,
                  hint: AppStrings.hintPostalCode,
                ),
                 CustomTextField(
                  width: double.infinity,
                  headerText: AppStrings.location,
                  hint: AppStrings.hintLocation,
                  onTap: () {},
                   redOnly:  true,
                  suffixIcon: const Icon(Icons.location_history),
                ),
                const SizedBox(height: AppDimens.large * 2),
                // Register button
                CustomButtonWidget(
                  onTap: () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const HomePage(),)),
                  text: AppStrings.register,width: double.infinity,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}



