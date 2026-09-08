import 'package:e_commerce_app/core/app_colors.dart';
import 'package:e_commerce_app/views/favorite/ui/favorite_screen.dart';
import 'package:e_commerce_app/views/home/ui/home_screen.dart';
import 'package:e_commerce_app/views/nav_bar/login/cubit/nav_bar_cubit.dart';
import 'package:e_commerce_app/views/profile/ui/profile_screen.dart';
import 'package:e_commerce_app/views/store/ui/strore_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

//this is away without bloc/cubit state management
enum TabsScreens {
  home(HomeScreen()),
  store(StroreScreen()),
  likes(FavoriteScreen()),
  profile(ProfileScreen());
  // and this what you must write in side the scaffold of MainHomeView
  //TabsScreens.values[_selectedIndex].screen)

  final Widget screen;
  const TabsScreens(this.screen);
}

class MainHomeView extends StatelessWidget {
  MainHomeView({super.key});

  final List<Widget> screens = [
    HomeScreen(),
    StroreScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          NavBarCubit cubit = BlocProvider.of<NavBarCubit>(context);
          //this is the same line above
          // NavBarCubit state = context.read<NavBarCubit>();
          return Scaffold(
            body: SafeArea(child: Center(child: screens[cubit.selectedIndex])),
            bottomNavigationBar: GNav(
              onTabChange: (value) {
                cubit.changeIndex(value);
              },
              tabMargin: EdgeInsetsGeometry.all(10),
              backgroundColor: AppColors.kWhiteColor,
              // rippleColor: AppColors.kPrimaryColor, // ripple color
              // hoverColor: AppColors.kPrimaryColor, // hover color
              // haptic: true, // haptic feedback
              // tabBorderRadius: 15,
              // tabActiveBorder: Border.all(
              //   color: Colors.black,
              //   width: 1,
              // ), // tab button border
              // tabBorder: Border.all(
              //   color: Colors.black,
              //   width: 1,
              // ), // tab button border
              // tabShadow: [
              //   BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8),
              // ], // tab button shadow
              // curve: Curves.easeOutExpo, // tab animation curves
              duration: Duration(milliseconds: 400), // tab animation duration
              gap: 5,
              // the tab button gap between icon and text
              color: AppColors.kGrayColor, // tab button color
              activeColor: AppColors.kWhiteColor, // selected icon color
              iconSize: 28, // tab button icon size
              tabBackgroundColor: AppColors.kPrimaryColor,
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ), // navigation bar padding

              tabs: [
                GButton(icon: Icons.home, text: 'Home'),
                GButton(icon: Icons.store, text: 'Store'),
                GButton(icon: Icons.favorite, text: 'Likes'),
                GButton(icon: Icons.person, text: 'Profile'),
              ],
            ),
          );
        },
      ),
    );
  }
}
