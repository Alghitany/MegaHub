import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_hub/features/authentication/login/ui/widget/login_form.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widget/app_text_button.dart';
import '../../../../core/widget/auth_other_methods.dart';
import '../../../../core/widget/auth_switch.dart';
import '../../../../core/widget/forget_password_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 70,right: 72,top: 18),
            child: Image.asset(
              "assets/images/login.png",
              height:296.h,
              width: double.infinity.w,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(child: Container(

            width: double.infinity.w,
            padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 0.h),
            decoration: BoxDecoration(
              color: AppColors.authBackground,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.r),
                topRight: Radius.circular(25.r),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const AuthSwitch(isSignup: false),
                  verticalSpace(16),
                  loginform(),
                  verticalSpace(8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ForgetPasswordText(),
                  ),
                  verticalSpace(16),
                  AppTextButton(
                    buttonText: "Login",
                    onPressed: () {
                    },
                  ),verticalSpace(16),
                  Text(
                    "Or Login with",
                    style: AppTextStyles.font12InterSemiBoldLavaRed,
                  ),
                  verticalSpace(8),
                  Align(
                    alignment: Alignment.center,
                    child: AuthOtherMethods(),
                  ),



                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
