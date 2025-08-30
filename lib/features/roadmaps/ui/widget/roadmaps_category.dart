import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';

class RoadmapsCategory extends StatefulWidget {
  const RoadmapsCategory({super.key});

  @override
  State<RoadmapsCategory> createState() => _RoadmapsCategoryState();
}

class _RoadmapsCategoryState extends State<RoadmapsCategory> {
  final List<String> tracks = ["All", "UI/UX", "Frontend", "Backend", "Flutter","Fullstack"];
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
              height: 25.h,
              padding: EdgeInsets.symmetric(horizontal: 20.h,vertical:8),
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
