import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';

class AchievementCard extends StatelessWidget {
  final String num;
  final String text;
  final String svgs;

  const AchievementCard({
    super.key,
    required this.num,
    required this.text,
    required this.svgs,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.appMainColor, width: 1.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  num,
                  style: AppTextStyles.achievementNumber
              ),
              Text(
                  text,
                  style:AppTextStyles.achievementText
              ),
            ],
          ),
          Flexible(
            child: SvgPicture.asset(
              svgs,
              height: 120.h,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}