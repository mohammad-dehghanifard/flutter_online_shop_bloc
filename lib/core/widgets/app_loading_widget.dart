import 'package:flutter/material.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_colors.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitThreeBounce(
      size: 32,
      color: AppColors.primaryColor,
    );
  }
}