import 'package:flutter/material.dart';
import 'package:mega_hub/core/theming/app_text_styles.dart';

class ForgetPasswordText extends StatelessWidget {
  const ForgetPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        "Forget password?",
        style: AppTextStyles.font12InterSemiBoldLavaRed,
      ),
    );
  }
}
