import 'package:flutter/material.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_dimens.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_strings.dart';
import 'package:flutter_online_shop_bloc/core/helpers/select_and_crop_image_handler.dart';
import 'package:flutter_online_shop_bloc/core/widgets/custom_button_widget.dart';
import 'package:flutter_online_shop_bloc/core/widgets/custom_text_field_widget.dart';
import 'package:flutter_online_shop_bloc/core/widgets/user_avatar_widget.dart';
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
                UserAvatarWidget(
                  onTap: () async {
                    await imageHandler.selectAndCropImage(source: ImageSource.gallery);
                    setState(() {});
                  },
                  imageFile: imageHandler.getImage,
                ),
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
                  onTap: () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const MainPage(),)),
                  text: AppStrings.register,width: double.infinity,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

