import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_hub/core/theming/app_colors.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final double? hintFontSize;
  final Color? hintTextColor;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final double? borderRadius;

  const CustomInputField({
    super.key,
     this.controller,
    required this.hintText,
     this.prefixIcon,
    this.validator,
    this.obscureText = false,
    this.suffixIcon, this.hintFontSize, this.hintTextColor,  this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:  TextStyle(fontSize: hintFontSize??12.sp, color: hintTextColor??AppColors.smokeyGrey),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius:BorderRadius.circular(borderRadius??16.r),
        ),
      ),
    );
  }
}
