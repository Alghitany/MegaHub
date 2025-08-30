import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/home_cubit.dart';
import '../../../logic/home_state.dart';
import 'home_top_bar.dart';
import 'home_top_bar_shimmer_loading.dart';

class HomeTopBarBlocBuilder extends StatelessWidget {
  const HomeTopBarBlocBuilder({super.key});

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
          userLoading: () => const HomeTopBarShimmerLoading(),
          userSuccess: (userDetails) => _buildSuccess(userDetails),
          userError: (errorHandler) => _buildError(errorHandler),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget _buildSuccess(userDetails) {
    if (userDetails == null) {
      return const Text("No user found");
    }

    return HomeTopBar(userDetails: userDetails);
  }

  Widget _buildError(errorHandler) {
    return Text(
      errorHandler.message ?? "Error loading user",
      style: const TextStyle(color: Colors.red),
    );
  }
}
