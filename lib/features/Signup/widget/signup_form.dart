import 'package:flutter/material.dart';
import 'package:mega_hub/core/helpers/spacing.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_text_styles.dart';
import '../../../core/widget/custom_input_field.dart';
import '../controller/signup_controller.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _controller = SignupController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),),),
      child: SingleChildScrollView(
        child: Form(key: _controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              verticalSpace(72),
              CustomInputField(
                controller: _controller.nameController,
                hintText: "Name",
                prefixIcon:Icon(Icons.person),
                validator: (value) => value!.isEmpty ? 'Enter your full name' : null,),
              verticalSpace(16),
              CustomInputField(
                controller: _controller.emailController,
                hintText: "Email",
                prefixIcon: Icon(Icons.email_outlined),
                validator: _controller.validateEmail,),
              verticalSpace(16),
              CustomInputField(
                controller: _controller.passwordController,
                hintText: "Password",
                prefixIcon: Icon(Icons.lock_outline),
                obscureText: _controller.obscurePassword1,
                suffixIcon: IconButton(
                  icon: Icon(_controller.obscurePassword1
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,),
                  onPressed: () {setState(() {
                      _controller.toggleObscure1();});},),
                validator: _controller.validatePassword,),
              verticalSpace(16),
              CustomInputField(
                controller: _controller.confirmPasswordController,
                hintText: "Confirm Password",
                prefixIcon: Icon(Icons.lock_outline),
                obscureText: _controller.obscurePassword2,
                suffixIcon: IconButton(
                  icon: Icon(
                    _controller.obscurePassword2
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,),
                  onPressed: () {setState(() {
                      _controller.toggleObscure2();});},),
                validator: _controller.validatePassword,),
              verticalSpace(8),
              Align(alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Forgot password?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.appMainColor,),),),),
              verticalSpace(24),
              SizedBox(width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _controller.registerUser(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.appMainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),),
                    padding: const EdgeInsets.symmetric(vertical: 15),),
                  child: const Text("Signup", style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,),),),),],),),),);}
}
