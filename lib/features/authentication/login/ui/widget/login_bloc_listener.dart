import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_hub/core/helpers/extensions.dart';
import 'package:mega_hub/core/theming/app_colors.dart';
import 'package:mega_hub/core/theming/app_text_styles.dart';
import 'package:mega_hub/features/authentication/login/logic/login_state.dart';

import '../../../../../core/networking/api_error_model.dart';
import '../../../../../core/routing/routes.dart';
import '../../logic/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoading ||
          current is LoginSuccess ||
          current is LoginError,
      listener: (context, state) {
        state.whenOrNull(
          loginLoading: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Logging in..."),
                backgroundColor: AppColors.appMainColor,
                duration: Duration(seconds: 1),
              ),
            );
          },
          loginSuccess: (loginResponse) {
            context.pushReplacementNamed(Routes.homeScreen);
          },
          loginError: (apiErrorModel) {
            setupErrorState(context, apiErrorModel);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, ApiErrorModel apiErrorModel) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          apiErrorModel.getAllErrorMessages(),
          style: AppTextStyles.font15InterMediumRedLava,
        ),
        backgroundColor: Colors.white,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
