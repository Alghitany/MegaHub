import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_hub/core/helpers/spacing.dart';

class AuthOtherMethods extends StatelessWidget {
  const AuthOtherMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.w,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              "assets/svgs/google.png",
              width: 48.w,
              height: 48.h,
            ),
          ),
          horizontalSpace(24),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              "assets/svgs/apple.svg",
              width: 39.w,
              height: 48.h,
            ),
          ),
          horizontalSpace(24),
          GestureDetector(
            onTap: () {},
            child: Image.asset(
              "assets/svgs/facebook.png",
              width: 48.w,
              height: 48.h,
            ),
          ),
        ],
      ),
    );
  }
}
