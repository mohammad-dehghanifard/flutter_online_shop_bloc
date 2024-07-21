import 'package:flutter/material.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_dimens.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_strings.dart';
import 'package:flutter_online_shop_bloc/core/widgets/custom_button_widget.dart';
import 'package:flutter_online_shop_bloc/core/widgets/custom_text_field_widget.dart';
import 'package:flutter_online_shop_bloc/features/auth/presentation/pages/check_otp_page.dart';
import 'package:flutter_online_shop_bloc/gen/assets.gen.dart';

class SendOtpPage extends StatelessWidget {
  const SendOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.pageMargin),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                Image.asset(Assets.png.mainLogo.path),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.10),
                const SizedBox(height: AppDimens.medium),
                // input number
                CustomTextField(
                  headerText: AppStrings.enterYourNumber,
                  hint: AppStrings.hintPhoneNumber,
                  width: MediaQuery.sizeOf(context).width * 0.70,
                ),
                // send otp button
                CustomButtonWidget(
                  onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => const CheckOtpPage(),)),
                  text: AppStrings.sendOtpCode,
                  width: MediaQuery.sizeOf(context).width * 0.50,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}




