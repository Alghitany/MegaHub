import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_hub/core/helpers/spacing.dart';
import 'package:mega_hub/core/theming/app_text_styles.dart';

import '../../../../../core/theming/app_colors.dart';

class CircleCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subText;
  final VoidCallback? onMoreTap;

  const CircleCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subText,
    this.onMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 305.h,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.appMainColor, width: 1.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 150.h,
              fit: BoxFit.cover,
            ),
          ),
          verticalSpace(8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.font24InderRegularLavaRed),
                verticalSpace(8),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: subText),
                      TextSpan(
                        text: " more..",
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap =
                              onMoreTap ??
                              () {
                                debugPrint("More tapped on $title");
                              },
                      ),
                    ],
                  ),
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: Colors.black,
                    height: 1.4,
                  ),
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
