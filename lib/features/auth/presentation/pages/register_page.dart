import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_dimens.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_strings.dart';
import 'package:flutter_online_shop_bloc/core/helpers/select_and_crop_image_handler.dart';
import 'package:flutter_online_shop_bloc/core/widgets/app_loading_widget.dart';
import 'package:flutter_online_shop_bloc/core/widgets/custom_button_widget.dart';
import 'package:flutter_online_shop_bloc/core/widgets/custom_text_field_widget.dart';
import 'package:flutter_online_shop_bloc/core/widgets/user_avatar_widget.dart';
import 'package:flutter_online_shop_bloc/features/auth/bloc/register_cubit.dart';
import 'package:flutter_online_shop_bloc/features/auth/data/request/register_request.dart';
import 'package:flutter_online_shop_bloc/features/auth/presentation/widgets/register_page_app_bar_widget.dart';
import 'package:flutter_online_shop_bloc/features/main/pages/main_page.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final SelectAndCropImageHandler imageHandler = SelectAndCropImageHandler();
  final RegisterRequest registerRequest = RegisterRequest();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        appBar: const RegisterPageAppBarWidget(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.pageMargin),
              child: BlocConsumer<RegisterCubit, RegisterState>(
                listener: (context, state) {
                  if(state is RegisterPickLocationState) {
                    registerRequest.lat = state.location.latitude;
                    registerRequest.lng = state.location.longitude;
                  }
                  if(state is RegisterVerifiedState) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainPage()));
                  } else if(state is RegisterErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("error...")));
                  }
                },
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // avatar
                      UserAvatarWidget(
                        onTap: () async {
                          await imageHandler.selectAndCropImage(
                              source: ImageSource.gallery);
                          setState(() {});
                          if(imageHandler.getImage != null) {
                            registerRequest.image = imageHandler.getImage;
                          }
                        },
                        imageFile: imageHandler.getImage,
                      ),
                      // forms
                      // full name
                       CustomTextField(
                         controller: registerRequest.fullNameTxt,
                        width: double.infinity,
                        headerText: AppStrings.nameLastName,
                        hint: AppStrings.hintNameLastName,
                      ),
                       // home number
                       CustomTextField(
                         controller:  registerRequest.phoneTxt,
                        width: double.infinity,
                        headerText: AppStrings.homeNumber,
                        hint: AppStrings.hintHomeNumber,
                      ),
                      // address
                       CustomTextField(
                        controller: registerRequest.addressTxt,
                        width: double.infinity,
                        headerText: AppStrings.address,
                        hint: AppStrings.hintAddress,
                      ),
                      // postal code
                      CustomTextField(
                        controller: registerRequest.postalCodeTxt,
                        width: double.infinity,
                        headerText: AppStrings.postalCode,
                        hint: AppStrings.hintPostalCode,
                      ),
                      // pick location
                      CustomTextField(
                        width: double.infinity,
                        headerText: AppStrings.location,
                        hint: AppStrings.hintLocation,
                        onTap: () => BlocProvider.of<RegisterCubit>(context).setLocation(context),
                        redOnly: true,
                        suffixIcon: const Icon(Icons.location_history),
                      ),
                      const SizedBox(height: AppDimens.large * 2),
                      // Register button
                      if(state is RegisterLoadingState)...[
                        const AppLoadingWidget()
                      ]else...[
                        CustomButtonWidget(
                          onTap: () => BlocProvider.of<RegisterCubit>(context).register(registerRequest),
                          text: AppStrings.register,
                          width: double.infinity,
                        )
                      ]

                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
