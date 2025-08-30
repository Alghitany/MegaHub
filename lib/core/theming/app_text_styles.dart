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
  static final TextStyle font24plusJakartaSansBoldBlack = TextStyle(
    fontSize: 24.sp,
    fontFamily: "PlusJakartaSans",
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static final TextStyle listTileTitleStyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle font16plusJakartaSansExtraBoldLavaRed = TextStyle(
    fontSize: 16.sp,
    fontFamily: "PlusJakartaSans",
    fontWeight: FontWeightHelper.extraBold,
    color: AppColors.appMainColor,
  );
  static final TextStyle font12plusJakartaSansRegularCarbonGrey = TextStyle(
    fontSize: 12.sp,
    fontFamily: "PlusJakartaSans",
    fontWeight: FontWeightHelper.regular,
    color: AppColors.carbonGrey,
  );
  static final TextStyle font11plusJakartaSansRegularCarbonGrey = TextStyle(
    fontSize: 11.sp,
    fontFamily: "PlusJakartaSans",
    fontWeight: FontWeightHelper.regular,
    color: AppColors.carbonGrey,
  );
  static final TextStyle font16plusJakartaSansMediumWhite = TextStyle(
    fontSize: 16.sp,
    fontFamily: "PlusJakartaSans",
    fontWeight: FontWeightHelper.medium,
    color: Colors.white,
  );
  static final TextStyle font12plusJakartaSansSemiBoldBalticSea = TextStyle(
    fontSize: 12.sp,
    fontFamily: "PlusJakartaSans",
    fontWeight: FontWeightHelper.semiBold,
    color: AppColors.balticSea,
  );

  static final TextStyle achievementNumber = TextStyle(
    fontSize: 66.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.appMainColor,
  );

  static final TextStyle achievementText = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static final TextStyle AchievmentsText = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static final TextStyle SeeAllText = TextStyle(
    color: AppColors.appMainColor,
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
  );
  static final TextStyle MegaEventTitle = TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.w800,
    color: AppColors.appMainColor,
  );

  static final TextStyle MegaEventDescription = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.achievementsTextColor,
  );

  static final TextStyle MegaEventButtonText = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static final TextStyle font20InderRegularDarkJungleGreen = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.darkJungleGreen,
    fontFamily: "Inder",
  );

  static final TextStyle font24InderRegularLavaRed = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.regular,
    color: AppColors.appMainColor,
    fontFamily: "Inder",
  );
}
