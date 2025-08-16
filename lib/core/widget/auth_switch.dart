import 'package:flutter/material.dart';
import 'package:mega_hub/core/helpers/extensions.dart';
import 'package:mega_hub/core/routing/routes.dart';

import '../theming/app_text_styles.dart';

class AuthSwitch extends StatelessWidget {
  final bool isSignup; // true = signup screen, false = login screen

  const AuthSwitch({super.key, required this.isSignup});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            if (!isSignup) {
              context.pushNamed(Routes.signupScreen);
            }
          },
          child: Text(
            "Signup",
            style: isSignup
                ? AppTextStyles.authSwitchChosen
                : AppTextStyles.authSwitchNotChosen,
          ),
        ),
        TextButton(
          onPressed: () {
            if (isSignup) {
              context.pushNamed(Routes.loginScreen);
            }
          },
          child: Text(
            "Login",
            style: !isSignup
                ? AppTextStyles.authSwitchChosen
                : AppTextStyles.authSwitchNotChosen,
          ),
        ),
      ],
    );
  }
}
