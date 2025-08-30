import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_hub/core/theming/app_text_styles.dart';

import '../../../../core/theming/app_colors.dart';

class MegaEvents {
  final String title;
  final String description;
  final String iconsvgs;
  final String imageAsset;
  final String buttonText;

  const MegaEvents({
    required this.title,
    required this.description,
    required this.iconsvgs,
    required this.imageAsset,
    required this.buttonText,
  });
}

class EventsCard extends StatelessWidget {
  final MegaEvents megaEvents;
  final VoidCallback? onPressed;

  const EventsCard({super.key, required this.megaEvents, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.appMainColor, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  megaEvents.iconsvgs,
                  height: 30.h,
                  width: 30.w,
                ),
                SizedBox(width: 8.w),
                Text(megaEvents.title, style: AppTextStyles.MegaEventTitle),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(radius: 35, backgroundImage: AssetImage("")),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    megaEvents.description,
                    style: AppTextStyles.MegaEventDescription,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            MaterialButton(
              onPressed: onPressed,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.5.h),
              color: AppColors.appMainColor,
              child: Text(
                megaEvents.buttonText,
                style: AppTextStyles.MegaEventButtonText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
