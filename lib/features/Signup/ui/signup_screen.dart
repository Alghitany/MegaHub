import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/widget/login_and_signup_switch.dart';
import '../widget/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            "assets/images/signup_ui.jpg",
            height: 413.h,
            width: double.infinity.w,
            fit: BoxFit.cover,
          ),
          LoginAndSignupSwitch(),
          const Expanded(
            child: SignupForm(),
          ),

        ],
      ),
    );
  }
}