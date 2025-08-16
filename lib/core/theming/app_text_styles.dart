import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_hub/core/helpers/font_weight_helper.dart';
import 'package:mega_hub/core/theming/app_colors.dart';

class AppTextStyles {
  static final TextStyle megaSplash = TextStyle(
    fontSize: 48.sp,
    fontWeight: FontWeightHelper.light,
    color: Colors.white,
    letterSpacing: 8.0,
  );
  static final TextStyle loadingSplash = TextStyle(
    fontSize: 14.sp,
    color: Colors.white.withOpacity(0.8),
  );
  static final TextStyle hintStyle = TextStyle(
    fontSize: 12.sp,
    fontFamily: 'Inter',
    fontWeight: FontWeightHelper.regular,
    color: AppColors.smokeyGrey,
  );
  static final TextStyle authSwitchChosen = TextStyle(
    fontSize: 16.sp,
    fontFamily: "Inter",
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.appMainColor,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.appMainColor,
  );
  static final TextStyle authSwitchNotChosen = TextStyle(
    fontSize: 16.sp,
    fontFamily: "Inter",
    fontWeight: FontWeightHelper.semiBold,
    color: Colors.black,
  );
  static final TextStyle defaultButtonText = TextStyle(
    fontSize: 24.sp,
    fontFamily: "PlusJakartaSans",
    fontWeight: FontWeightHelper.medium,
    color: Colors.white,
  );
  static final TextStyle font12InterSemiBoldLavaRed = TextStyle(
    fontSize: 12.sp,
    fontFamily: "Inter",
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.appMainColor,
  );
  static final TextStyle font15InterMediumRedLava = TextStyle(
    fontSize: 15.sp,
    fontFamily: "Inter",
    fontWeight: FontWeightHelper.medium,
    color: AppColors.appMainColor,
  );
}
