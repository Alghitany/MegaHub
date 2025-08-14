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
    color: Colors.white.withValues(alpha: 0.8),
  );
}