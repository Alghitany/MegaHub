import 'package:flutter/material.dart';
import '../../../core/service/api_service.dart';

class SignupController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscurePassword1 = true;
  bool obscurePassword2 = true;

  void toggleObscure1() => obscurePassword1 = !obscurePassword1;
  void toggleObscure2() => obscurePassword2 = !obscurePassword2;

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Enter your email';
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Enter your password';
    if (value.length < 8) return 'Password must be at least 8 characters';
    return null;
  }

  Future<void> registerUser(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    final fullName = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }

    final nameParts = fullName.split(' ');
    final firstName = nameParts.isNotEmpty ? nameParts.first : '';
    final lastName = nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';

    final body = {
      'firstName': firstName,
      'lastName': lastName,
      'userName': email.split('@')[0],
      'email': email,
      'password': password,
    };

    final result = await ApiService.register(body);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(result)),
    );
  }
}
