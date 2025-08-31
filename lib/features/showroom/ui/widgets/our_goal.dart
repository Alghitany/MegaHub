import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_hub/core/helpers/spacing.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';

class OurGoal extends StatelessWidget {
  const OurGoal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Our Goal",
          style: AppTextStyles.font20InderRegularDarkJungleGreen,
        ),
        verticalSpace(8),
        Container(
          height: 170.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColors.appMainColor, width: 1.w),
          ),
          child: Row(
            children: [
              horizontalSpace(8),
              Expanded(
                child: Text(
                  "The team aspires to form a growing community that includes all those wishing to learn the fields of computer science and technology, and this community becomes an integrated environment that qualifies them for the labor market by qualifying them scientifically and technically in addition to personal skills and Expand our activity all over Egypt.",
                  style: AppTextStyles.font11plusJakartaSansRegularCarbonGrey,
                ),
              ),
              horizontalSpace(8),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.r),
                  bottomRight: Radius.circular(16.r),
                ),
                child: Image.asset(
                  "assets/images/about_us.png",
                  width: 100.w,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
