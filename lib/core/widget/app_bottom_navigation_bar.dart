import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_hub/core/helpers/extensions.dart';
import 'package:mega_hub/core/routing/routes.dart';
import 'package:mega_hub/core/theming/app_colors.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;

  const AppBottomNavigationBar({super.key, required this.selectedIndex});

  void _onItemTapped(BuildContext context, int index) {
    if (index == selectedIndex) return; // prevent reloading same page
    switch (index) {
      case 0:
        context.pushReplacementNamed(Routes.homeScreen);
        break;
      case 1:
        context.pushReplacementNamed(Routes.showroomScreen);
        break;
      case 2:
        context.pushReplacementNamed(Routes.roadmapsScreen);
        break;
      case 3:
        context.pushReplacementNamed(Routes.profileScreen);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) => _onItemTapped(context, index),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.appMainColor,
      unselectedItemColor: AppColors.boulder,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/svgs/home.svg",
            height: 26.h,
            width: 26.w,
            colorFilter: ColorFilter.mode(
              selectedIndex == 0 ? AppColors.appMainColor : AppColors.boulder,
              BlendMode.srcIn,
            ),
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/svgs/showroom.svg",
            height: 26.h,
            width: 26.w,
            colorFilter: ColorFilter.mode(
              selectedIndex == 1 ? AppColors.appMainColor : AppColors.boulder,
              BlendMode.srcIn,
            ),
          ),
          label: "Showroom",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/svgs/roadmaps.svg",
            height: 26.h,
            width: 26.w,
            colorFilter: ColorFilter.mode(
              selectedIndex == 2 ? AppColors.appMainColor : AppColors.boulder,
              BlendMode.srcIn,
            ),
          ),
          label: "Roadmaps",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/svgs/profile.svg",
            height: 26.h,
            width: 26.w,
            colorFilter: ColorFilter.mode(
              selectedIndex == 3 ? AppColors.appMainColor : AppColors.boulder,
              BlendMode.srcIn,
            ),
          ),
          label: "Profile",
        ),
      ],
    );
  }
}
