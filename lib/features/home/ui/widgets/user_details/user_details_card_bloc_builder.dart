import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/home_cubit.dart';
import '../../../logic/home_state.dart';
import 'user_details_card.dart';
import 'user_details_shimmer_loading.dart';

class UserDetailsCardBlocBuilder extends StatelessWidget {
  const UserDetailsCardBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current.maybeWhen(
        userLoading: () => true,
        userSuccess: (_) => true,
        userError: (_) => true,
        orElse: () => false,
      ),
      builder: (context, state) {
        return state.maybeWhen(
          userLoading: () => setupLoading(),
          userSuccess: (userDetails) => setupSuccess(userDetails),
          userError: (errorHandler) => setupError(errorHandler),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  /// Loading shimmer while fetching user details
  Widget setupLoading() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: UserDetailsShimmerLoading(),
    );
  }

  /// Show user details card when API success
  Widget setupSuccess(userDetails) {
    if (userDetails == null) {
      return const Center(child: Text("No user details found"));
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: UserDetailsCard(userDetails: userDetails),
    );
  }

  /// Error fallback widget
  Widget setupError(errorHandler) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          errorHandler.message ?? "Failed to load user details",
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
