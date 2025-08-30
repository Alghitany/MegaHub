import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/networking/api_error_model.dart';
import '../data/models/user_details_response_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  // User states
  const factory HomeState.userLoading() = _UserLoading;

  const factory HomeState.userSuccess(UserDetailsResponseModel? userDetails) =
      _UserSuccess;

  const factory HomeState.userError(ApiErrorModel apiErrorModel) = _UserError;
}
