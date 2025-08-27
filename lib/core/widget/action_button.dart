import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Note: Correct import
import 'package:mega_hub/core/helpers/spacing.dart';

import '../theming/app_colors.dart';

class ActionButton extends StatelessWidget {
  final String label;
  final SvgPicture icon;

  const ActionButton({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.appMainColor, width: 1.w),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 7.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 40.h, width: 40.w, child: icon),
            verticalSpace(4),
            Text(
              label,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
