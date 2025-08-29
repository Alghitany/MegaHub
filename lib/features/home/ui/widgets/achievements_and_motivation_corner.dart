import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_hub/core/helpers/spacing.dart';
import 'package:mega_hub/core/theming/app_text_styles.dart';

import '../../../../core/theming/app_colors.dart';

class AchievementsAndMotivationCorner extends StatelessWidget {
  const AchievementsAndMotivationCorner({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 105.w,
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.appMainColor, width: 1.w),
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/svgs/achievement.png",
                height: 48.h,
                width: 48.w,
              ),
              verticalSpace(8),
              Text(
                "Achievements",
                style: AppTextStyles.font12plusJakartaSansSemiBoldBalticSea,
              ),
            ],
          ),
        ),
        horizontalSpace(16),
        Expanded(
          child: Container(
            height: 120.h,
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.appMainColor, width: 1.w),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/svgs/motivationcorner.svg",
                      height: 48.h,
                      width: 48.w,
                    ),
                    Text(
                      '"Keep going — every small\nstep forward is still progress\ntoward your bigger dream."',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontStyle: FontStyle.italic,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                verticalSpace(8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Motivation Corner",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
