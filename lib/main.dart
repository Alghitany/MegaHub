import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mega_hub/core/helpers/extensions.dart';

import 'core/di/dependecy_injection.dart';
import 'core/helpers/constants.dart';
import 'core/helpers/shared_pref_helper.dart';
import 'core/routing/app_router.dart';
import 'mega_hub_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  // To fix texts being hidden bug in flutter_screenutil in release mode
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedUser();
  runApp(MegaHubApp(appRouter: AppRouter()));
}
checkIfLoggedUser() async {
  String? userToken =
  await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}