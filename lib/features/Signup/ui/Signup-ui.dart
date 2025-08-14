import 'package:flutter/material.dart';
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
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const Expanded(
            child: SignupForm(),
          ),
        ],
      ),
    );
  }
}
