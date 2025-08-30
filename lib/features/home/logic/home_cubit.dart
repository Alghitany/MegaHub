import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/user_details_response_model.dart';
import '../data/repos/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;

  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  UserDetailsResponseModel? userDetails;

  /// fetch user details
  void getUserDetails() async {
    emit(const HomeState.userLoading());

    final response = await _homeRepo.getUserDetails();

    response.when(
      success: (userDetailsResponse) {
        userDetails = userDetailsResponse;
        emit(HomeState.userSuccess(userDetails));
      },
      failure: (apiErrorModel) {
        emit(HomeState.userError(apiErrorModel));
      },
    );
  }
}
