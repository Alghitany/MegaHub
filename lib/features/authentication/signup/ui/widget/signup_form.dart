import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_hub/core/helpers/spacing.dart';
import 'package:mega_hub/core/widget/app_text_form_field.dart';

import '../../../../../core/helpers/app_regex.dart';
import '../../logic/signup_cubit.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<SignupCubit>().userNameController,
            hintText: "Name",
            prefixIcon: SvgPicture.asset(
              "assets/svgs/person.svg",
              fit: BoxFit.scaleDown,
              width: 15.5.w,
              height: 15.5.h,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your name";
              }
              return null;
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: context.read<SignupCubit>().emailController,
            hintText: "Email",
            prefixIcon: SvgPicture.asset(
              "assets/svgs/email.svg",
              fit: BoxFit.scaleDown,
              width: 19.w,
              height: 18.h,
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
            controller: context.read<SignupCubit>().passwordController,
            hintText: "Password",
            prefixIcon: SvgPicture.asset(
              "assets/svgs/lock.svg",
              fit: BoxFit.scaleDown,
              width: 15.w,
              height: 20.h,
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
          verticalSpace(16),
          AppTextFormField(
            controller: context.read<SignupCubit>().confirmPasswordController,
            hintText: "Confirm Password",
            prefixIcon: SvgPicture.asset(
              "assets/svgs/lock.svg",
              fit: BoxFit.scaleDown,
              width: 15.w,
              height: 20.h,
            ),
            isObscureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                      !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.doPasswordsMatch(
                    context.read<SignupCubit>().passwordController.text,
                    value,
                  )) {
                return 'Passwords doesn\'t match';
              }
            },
          ),
        ],
      ),
    );
  }
}
