import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_hub/features/authentication/signup/logic/signup_state.dart';

import '../data/models/signup_request_body.dart';
import '../data/repo/signup_repo.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;

  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  // Controllers for form fields
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  /// Dispose controllers to prevent memory leaks
  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    dateOfBirthController.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

  /// Trigger signup
  void emitSignupStates() async {
    emit(const SignupState.signupLoading());

    final response = await _signupRepo.signup(
      SignupRequestBody(
        firstName: "unknown",
        lastName: "unknown",
        dateOfBirth: "2000-10-10",
        userName: userNameController.text,
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    response.when(
      success: (signupResponse) {
        emit(SignupState.signupSuccess(signupResponse));
      },
      failure: (apiErrorModel) {
        emit(SignupState.signupError(apiErrorModel));
      },
    );
  }
}
