import 'package:flutter/material.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_colors.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_dimens.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_strings.dart';
import 'package:flutter_online_shop_bloc/core/widgets/custom_button_widget.dart';
import 'package:flutter_online_shop_bloc/core/widgets/custom_text_field_widget.dart';
import 'package:flutter_online_shop_bloc/features/auth/presentation/pages/register_page.dart';
import 'package:flutter_online_shop_bloc/gen/assets.gen.dart';

class CheckOtpPage extends StatelessWidget {
  const CheckOtpPage({super.key});

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
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
                const SizedBox(height: AppDimens.medium),
                // info
                Text(AppStrings.otpCodeSendFor.replaceAll("replace", "09351592323")),
                // edit phone
                TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      overlayColor: WidgetStatePropertyAll(AppColors.primaryColor.withOpacity(0.10)),
                    ),
                    child: Text(AppStrings.wrongNumberEditNumber,style: Theme.of(context).textTheme.bodyMedium!.apply(color: AppColors.primaryColor),),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
                // resend code
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppDimens.large,vertical: AppDimens.small),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppStrings.enterVerificationCode),
                      Text("02:45")
                    ],
                  ),
                ),
                CustomTextField(
                  hint: AppStrings.hintVerificationCode,
                  width: MediaQuery.sizeOf(context).width * 0.80,
                ),
                // send otp button
                CustomButtonWidget(
                  onTap: () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const RegisterPage())),
                  text: AppStrings.next,
                  width: MediaQuery.sizeOf(context).width * 0.70,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
