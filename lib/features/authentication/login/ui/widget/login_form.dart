import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_hub/features/authentication/login/logic/login_cubit.dart';

import '../../../../../core/helpers/app_regex.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widget/app_text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isPasswordObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<LoginCubit>().emailController,
            hintText: "Email",
            prefixIcon: SvgPicture.asset(
              "assets/svgs/email.svg",
              fit: BoxFit.scaleDown,
              width: 19.166667938232422.w,
              height: 18.208332061767578.h,
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return "Please enter your email";
              }
              return null;
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            hintText: "Password",
            prefixIcon: SvgPicture.asset(
              "assets/svgs/lock.svg",
              fit: BoxFit.scaleDown,
              width: 15.333334922790527.w,
              height: 20.125001907348633.h,
            ),
            isObscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPasswordValid(value)) {
                return 'Please enter a valid password';
              }
            },
          ),
        ],
      ),
    );
  }
}
