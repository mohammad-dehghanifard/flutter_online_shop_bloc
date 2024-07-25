import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_colors.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_dimens.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_strings.dart';
import 'package:flutter_online_shop_bloc/core/widgets/app_loading_widget.dart';
import 'package:flutter_online_shop_bloc/core/widgets/custom_button_widget.dart';
import 'package:flutter_online_shop_bloc/core/widgets/custom_text_field_widget.dart';
import 'package:flutter_online_shop_bloc/features/auth/bloc/auth_cubit.dart';
import 'package:flutter_online_shop_bloc/features/auth/presentation/pages/register_page.dart';
import 'package:flutter_online_shop_bloc/features/auth/presentation/widgets/text_timer_widget.dart';
import 'package:flutter_online_shop_bloc/gen/assets.gen.dart';

class CheckOtpPage extends StatelessWidget {
  const CheckOtpPage({super.key, required this.mobileNumber});

  final String mobileNumber;

  @override
  Widget build(BuildContext context) {
    final TextEditingController otpCodeText = TextEditingController();
    return Scaffold(
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
                Text(AppStrings.otpCodeSendFor
                    .replaceAll("replace", mobileNumber.toString())),
                // edit phone
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ButtonStyle(
                    overlayColor: WidgetStatePropertyAll(
                        AppColors.primaryColor.withOpacity(0.10)),
                  ),
                  child: Text(
                    AppStrings.wrongNumberEditNumber,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: AppColors.primaryColor),
                  ),
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
                // resend code
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDimens.large, vertical: AppDimens.small),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(AppStrings.enterVerificationCode),
                      TextTimerWidget(time: 120),
                    ],
                  ),
                ),
                CustomTextField(
                  controller: otpCodeText,
                  hint: AppStrings.hintVerificationCode,
                  width: MediaQuery.sizeOf(context).width * 0.80,
                ),
                // send otp button
                BlocProvider(
                  create: (context) => AuthCubit(),
                  child: BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthVerifiedState) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()));
                      } else if (state is AuthErrorSendSmsState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("error message...")));
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthLoadingState) {
                        return const AppLoadingWidget();
                      } else {
                        return CustomButtonWidget(
                          onTap: () => BlocProvider.of<AuthCubit>(context)
                              .verifyOtpCode(mobileNumber, otpCodeText.text),
                          text: AppStrings.next,
                          width: MediaQuery.sizeOf(context).width * 0.70,
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
