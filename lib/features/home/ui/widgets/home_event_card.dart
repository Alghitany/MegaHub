import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_hub/core/theming/app_colors.dart';
import 'package:mega_hub/core/theming/app_text_styles.dart';
import 'package:mega_hub/core/widget/app_text_button.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widget/timer.dart';

class HomeEventCard extends StatelessWidget {
  const HomeEventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.appMainColor, width: 1.w),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(radius: 28.r, backgroundImage: AssetImage('assets/images/megaevent.png')),
                horizontalSpace(12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "MEGA Event",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.red,
                        fontSize: 16.sp,
                      ),
                    ),
                    verticalSpace(4),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 14,
                          color: Colors.grey,
                        ),
                        horizontalSpace(4),
                        Text(
                          "15 August, 2025",
                          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                        ),
                        horizontalSpace(8),
                        Icon(Icons.access_time, size: 14, color: Colors.grey),
                        horizontalSpace(4),
                        Text(
                          "02:00 PM",
                          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            verticalSpace(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TimerBlock(value: "02", label: "Days"),
                TimerBlock(value: "48", label: "Hours"),
                TimerBlock(value: "28", label: "Minutes"),
              ],
            ),
            verticalSpace(8),
            AppTextButton(
              buttonText: "Book Now!",
              buttonHeight: 25.h,
              buttonWidth: 248.w,
              horizontalPadding: 0.w,
              verticalPadding: 0.h,
              textStyle: AppTextStyles.font16plusJakartaSansMediumWhite,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
