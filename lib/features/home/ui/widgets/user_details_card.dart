import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_hub/core/theming/app_colors.dart';
import 'package:mega_hub/core/theming/app_text_styles.dart';

import '../../../../core/helpers/spacing.dart';

class UserDetailsCard extends StatelessWidget {
  const UserDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.appMainColor, width: 1.w),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
        child: Row(
          children: [
            CircleAvatar(backgroundImage: AssetImage('')),
            horizontalSpace(11.5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "User Details",
                  style: AppTextStyles.font16plusJakartaSansExtraBoldLavaRed,
                ),
                Text(
                  "UserName",
                  style: AppTextStyles.font12plusJakartaSansRegularCarbonGrey,
                ),
                Text(
                  "ID: D124589",
                  style: AppTextStyles.font12plusJakartaSansRegularCarbonGrey,
                ),
                Text(
                  "Progress Level: Beginner",
                  style: AppTextStyles.font12plusJakartaSansRegularCarbonGrey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
