import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';

class Roadmaps extends StatefulWidget {
  const Roadmaps({super.key});

  @override
  State<Roadmaps> createState() => _RoadmapsState();
}

class _RoadmapsState extends State<Roadmaps> {
  final List<String> tracks = ["All", "Events", "Podcast", "challenges", "other",];
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
                color: isSelected ? AppColors.appMainColor : AppColors.AchievmentsColor,
                borderRadius: BorderRadius.circular(25),
              ),
              alignment: Alignment.center,
              child: Text(
                tracks[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : AppColors.AchievmentsTextColor,
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
