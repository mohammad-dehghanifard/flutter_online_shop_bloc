import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_shop_bloc/core/constants/api_end_points.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_keys.dart';
import 'package:flutter_online_shop_bloc/core/helpers/preferences_manager.dart';
import 'package:flutter_online_shop_bloc/features/auth/presentation/pages/send_otp_page.dart';
import '../../home/presentation/pages/home_page.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial()){
    emit(AuthUserNotRegisteredState());
  }
  final Dio _dio = Dio();

  sendSms(String mobile) async {
    emit(AuthLoadingState());
    try {
      final Response response = await _dio.post(ApiEndPoints.sendSms,data: {"mobile" : mobile});
      debugPrint(response.toString());

      if(response.statusCode == 201) {
        emit(AuthSendSmsState());
      } else {
        emit(AuthErrorSendSmsState());
      }

    } catch(e) {
          emit(AuthErrorSendSmsState());
    }
  }

  verifyOtpCode(String mobile,String code) async {
    emit(AuthLoadingState());
    try {
      final Response response = await _dio.post(ApiEndPoints.checkSmsCode,data: {"mobile" : mobile,"code" : code});
      debugPrint(response.toString());

      if(response.data['data']['token'] != null){
        SharedPreferencesManager().saveString(key: AppKeys.token,value: response.data['data']['token']);
        if(response.statusCode == 201) {
          if(response.data['data']['is_registered']){
            emit(AuthUserRegisteredState());
          } else {
            emit(AuthUserNotRegisteredState());
          }
        }
      }

    } catch(e) {
      emit(AuthErrorSendSmsState());
    }
  }

  checkLoggedIn(BuildContext context){
    if(state is AuthUserRegisteredState) {
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const HomePage()));
    } else if(state is AuthUserNotRegisteredState) {
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const SendOtpPage()));
    }
  }


}
