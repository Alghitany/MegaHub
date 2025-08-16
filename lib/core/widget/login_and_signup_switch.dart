import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/font_weight_helper.dart';
import '../theming/app_colors.dart';
import '../theming/app_text_styles.dart';

class LoginAndSignupSwitch extends StatefulWidget {
  const LoginAndSignupSwitch({super.key});

  @override
  State<LoginAndSignupSwitch> createState() => _LoginAndSignupSwitchState();
}

class _LoginAndSignupSwitchState extends State<LoginAndSignupSwitch> {
  @override
  Widget build(BuildContext context) {
    bool isLogin = false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              isLogin=true;
            });
          },
          child:  Text(
            "Signup",
            style:isLogin ? AppTextStyles.loginAndSignupSwitchUnchosed: AppTextStyles.loginAndSignupSwitchChosed,
          ),
        ),
        TextButton(
          onPressed: () {setState(() {
            isLogin=false;
          });},
          child:  Text(
            "Login",
            style:isLogin?AppTextStyles.loginAndSignupSwitchUnchosed: AppTextStyles.loginAndSignupSwitchChosed,
          ),
        ),
      ],
    );
  }
}
