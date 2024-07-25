import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_colors.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_dimens.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_strings.dart';
import 'package:flutter_online_shop_bloc/features/auth/bloc/auth_cubit.dart';
import 'package:flutter_online_shop_bloc/features/auth/presentation/pages/send_otp_page.dart';
import 'package:flutter_online_shop_bloc/features/home/presentation/pages/home_page.dart';
import 'package:flutter_online_shop_bloc/gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) => BlocProvider.of<AuthCubit>(context).checkLoggedIn(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(Assets.png.mainLogo.path),
          const SizedBox(height: AppDimens.medium),
          const SpinKitThreeBounce(size: AppDimens.large,color: AppColors.amazingColor),
          const Spacer(),
          Text(AppStrings.version,style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: AppDimens.medium),
        ],
      ),
    );
  }
}
