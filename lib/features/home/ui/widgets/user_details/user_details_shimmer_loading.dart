import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/helpers/spacing.dart';

class UserDetailsShimmerLoading extends StatelessWidget {
  const UserDetailsShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade300, width: 1.w),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
        child: Row(
          children: [
            // Circle shimmer
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: CircleAvatar(
                radius: 28.r,
                backgroundColor: Colors.grey.shade300,
              ),
            ),
            horizontalSpace(11.5),

            // Text shimmer placeholders
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                shimmerLine(width: 120.w, height: 14.h),
                verticalSpace(6),
                shimmerLine(width: 100.w, height: 12.h),
                verticalSpace(6),
                shimmerLine(width: 80.w, height: 12.h),
                verticalSpace(6),
                shimmerLine(width: 140.w, height: 12.h),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget shimmerLine({required double width, required double height}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }
}
