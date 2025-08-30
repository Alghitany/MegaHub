import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_hub/core/helpers/spacing.dart';
import 'package:mega_hub/core/theming/app_text_styles.dart';

import '../../../../core/theming/app_colors.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Our Goal",
          style: AppTextStyles.font20InderRegularDarkJungleGreen,
        ),
        verticalSpace(8),
        Container(
          height: 150.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColors.appMainColor, width: 1.w),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  bottomLeft: Radius.circular(16.r),
                ),
                child: Image.asset(
                  "assets/images/about_us.png",
                  width: 100.w,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              horizontalSpace(8),
              Expanded(
                child: Text(
                  "Mega is a volunteering Team interested\nin computer science & Information\nTechnology field, founded in 2018 at\nFaculty of Computer and Information\nscience. Mega Team aims to help all\nenthusiasts In Tech and Career\ndevelopment fields by Providing Them\nwith best Facilities, Tools and mentors.",
                  style: AppTextStyles.font12plusJakartaSansRegularCarbonGrey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
