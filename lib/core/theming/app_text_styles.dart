import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_hub/core/helpers/font_weight_helper.dart';

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
}

class AppSpacing {
  static const double small = 8.0;
  static const double medium = 15.0;
  static const double large = 20.0;
  static const double extraLarge = 30.0;
}
