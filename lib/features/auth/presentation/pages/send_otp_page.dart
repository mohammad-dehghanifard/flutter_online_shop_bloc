import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_colors.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_dimens.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_strings.dart';
import 'package:flutter_online_shop_bloc/core/widgets/custom_button_widget.dart';
import 'package:flutter_online_shop_bloc/core/widgets/custom_text_field_widget.dart';
import 'package:flutter_online_shop_bloc/features/auth/bloc/auth_cubit.dart';
import 'package:flutter_online_shop_bloc/features/auth/presentation/pages/check_otp_page.dart';
import 'package:flutter_online_shop_bloc/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SendOtpPage extends StatelessWidget {
  const SendOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController mobileText = TextEditingController();
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
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.10),
                const SizedBox(height: AppDimens.medium),
                // input number
                CustomTextField(
                  controller: mobileText,
                  headerText: AppStrings.enterYourNumber,
                  hint: AppStrings.hintPhoneNumber,
                  width: MediaQuery.sizeOf(context).width * 0.70,
                ),
                BlocProvider(
                  create: (context) => AuthCubit(),
                  child: BlocConsumer<AuthCubit, AuthState>(
                    builder: (context, state) {
                      if (state is AuthLoadingState) {
                        return const SpinKitThreeBounce(
                          size: 32,
                          color: AppColors.primaryColor,
                        );
                      } else {
                        return CustomButtonWidget(
                          onTap: () => BlocProvider.of<AuthCubit>(context)
                              .sendSms(mobileText.text),
                          text: AppStrings.sendOtpCode,
                          width: MediaQuery.sizeOf(context).width * 0.50,
                        );
                      }
                    },
                    listener: (context, state) {
                      if (state is AuthSendSmsState) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckOtpPage(mobileNumber: mobileText.text),
                            ));
                      } else if (state is AuthErrorSendSmsState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("error message...")));
                      }
                    },
                  ),
                ),
                // send otp button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
