import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';

class AchievementCategory extends StatefulWidget {
  const AchievementCategory({super.key});

  @override
  State<AchievementCategory> createState() => _AchievementCategoryState();
}

class _AchievementCategoryState extends State<AchievementCategory> {
  final List<String> tracks = ["All", "Events", "Podcast", "challenges", "Online sessions",];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: tracks.length,
      itemBuilder: (context, index) {
        final isSelected = index == selectedIndex;
        return Padding(
          padding:  EdgeInsets.only(right: 8.r),
          child: InkWell(
            borderRadius: BorderRadius.circular(120),
            onTap: () {
              setState(() {
                selectedIndex = index;
              });},
            child: Container(
              height: 30.h,
              padding: EdgeInsets.symmetric(horizontal: 24.h,vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.appMainColor : AppColors.achievementsColor,
                borderRadius: BorderRadius.circular(25),
              ),
              alignment: Alignment.center,
              child: Text(
                tracks[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : AppColors.achievementsTextColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
