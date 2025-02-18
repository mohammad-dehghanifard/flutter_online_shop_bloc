import 'package:flutter/material.dart';
import 'package:flutter_online_shop_bloc/core/constants/app_colors.dart';
import 'package:flutter_online_shop_bloc/features/cart/presentation/pages/cart_page.dart';
import 'package:flutter_online_shop_bloc/features/home/presentation/pages/home_page.dart';
import 'package:flutter_online_shop_bloc/features/main/widgets/custom_navigation_widget.dart';
import 'package:flutter_online_shop_bloc/features/profile/peresentation/pages/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationWidget(
        selectedIndex: currentPageIndex,
        onChange: (int index) {
          setState(() {
            currentPageIndex = index;
            pageController.animateToPage(index, duration: const Duration(milliseconds: 400), curve: Curves.easeInSine);
          });
        },
      ),
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
        controller: pageController,
        children: const [
          HomePage(),
          CartPage(),
          ProfilePage(),
        ],
      )
    );
  }
}


