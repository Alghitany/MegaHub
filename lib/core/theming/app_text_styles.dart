import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_hub/core/helpers/font_weight_helper.dart';

import 'app_colors.dart';

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
  static final TextStyle loginAndSignupSwitchChosed = TextStyle(
    fontSize: 25.sp,
    color: AppColors.appMainColor,
    fontWeight: FontWeightHelper.bold,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.appMainColor,
  );
  static final TextStyle loginAndSignupSwitchUnchosed =TextStyle(
    fontSize: 25,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
}


