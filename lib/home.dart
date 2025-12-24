import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/features/cart_feature/presentation/page/cart_screen.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/presentation/page/favourite_screen.dart';
import 'package:mega_ecommerce_app/features/home_feature/presentation/page/home-screen.dart';
import 'package:mega_ecommerce_app/features/more_frature/presentation/page/more_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  var tabs = [HomeScreen(), FavouriteScreen(), CartScreen(), MoreScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          _bottomNavigationBarItem(
            index: 0,
            label: 'Home',
            iconPath: 'assets/icons/home.svg',
          ),
          _bottomNavigationBarItem(
            index: 1,
            label: 'Favourite',
            iconPath: 'assets/icons/favourite.svg',
          ),
          _bottomNavigationBarItem(
            index: 2,
            label: 'Cart',
            iconPath: 'assets/icons/cart.svg',
          ),
          _bottomNavigationBarItem(
            index: 3,
            label: 'More',
            iconPath: 'assets/icons/more.svg',
          ),
        ],
      ),

      body: tabs[selectedIndex],
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem({
    required int index,
    required String label,
    required String iconPath,
  }) {
    return BottomNavigationBarItem(
      icon: Center(child: SvgPicture.asset(iconPath, width: 24, height: 24)),
      activeIcon: Center(
        child: Text(
          label,
          style: AppTextStyles.regular13.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      label: '',
    );
  }
}
