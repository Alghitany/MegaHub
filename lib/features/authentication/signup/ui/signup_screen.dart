import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_hub/core/helpers/spacing.dart';
import 'package:mega_hub/core/theming/app_text_styles.dart';
import 'package:mega_hub/core/widget/app_text_button.dart';
import 'package:mega_hub/core/widget/auth_other_methods.dart';
import 'package:mega_hub/core/widget/auth_switch.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/widget/forget_password_text.dart';
import '../logic/signup_cubit.dart';
import 'widget/signup_bloc_listener.dart';
import 'widget/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            "assets/images/signup.png",
            height: 275.h,
            width: double.infinity.w,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Container(
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
                    // In Signup screen
                    const AuthSwitch(isSignup: true),
                    verticalSpace(16),
                    SignupForm(),
                    verticalSpace(8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ForgetPasswordText(),
                    ),
                    verticalSpace(16),
                    AppTextButton(
                      buttonText: "Signup",
                      onPressed: () {
                        validateThenDoSignup(context);
                      },
                    ),
                    verticalSpace(16),
                    Text(
                      "Or signup with",
                      style: AppTextStyles.font12InterSemiBoldLavaRed,
                    ),
                    verticalSpace(8),
                    Align(
                      alignment: Alignment.center,
                      child: AuthOtherMethods(),
                    ),
                    const SignupBlocListener(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}
